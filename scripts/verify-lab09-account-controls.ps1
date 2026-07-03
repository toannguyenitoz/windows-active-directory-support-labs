<#
.SYNOPSIS
    Verifies password, lockout and account control settings for Lab 09.

.DESCRIPTION
    This script verifies the Lab 09 default domain password/lockout policy and
    the dedicated lockout.test account state.

.RUN ON
    Domain Controller: SRV-DC01

.EXAMPLE
    Set-Location .\scripts
    .\verify-lab09-account-controls.ps1
#>

[CmdletBinding()]
param(
    [string]$SamAccountName = "lockout.test",
    [int]$ExpectedMinPasswordLength = 10,
    [int]$ExpectedPasswordHistoryCount = 5,
    [int]$ExpectedLockoutThreshold = 5,
    [int]$ExpectedLockoutDurationMinutes = 15,
    [int]$ExpectedLockoutObservationWindowMinutes = 15
)

Import-Module ActiveDirectory -ErrorAction Stop

$Domain = Get-ADDomain
$Policy = Get-ADDefaultDomainPasswordPolicy

Write-Host ""
Write-Host "Lab 09 - Verify Password, Lockout and Logon Controls" -ForegroundColor Cyan
Write-Host "Domain: $($Domain.DNSRoot)" -ForegroundColor Cyan
Write-Host ""

$PolicyReport = @(
    [PSCustomObject]@{
        Setting = "ComplexityEnabled"
        Expected = "True"
        Actual = $Policy.ComplexityEnabled
        Status = if ($Policy.ComplexityEnabled -eq $true) { "PASS" } else { "CHECK" }
    },
    [PSCustomObject]@{
        Setting = "MinPasswordLength"
        Expected = $ExpectedMinPasswordLength
        Actual = $Policy.MinPasswordLength
        Status = if ($Policy.MinPasswordLength -eq $ExpectedMinPasswordLength) { "PASS" } else { "CHECK" }
    },
    [PSCustomObject]@{
        Setting = "PasswordHistoryCount"
        Expected = $ExpectedPasswordHistoryCount
        Actual = $Policy.PasswordHistoryCount
        Status = if ($Policy.PasswordHistoryCount -eq $ExpectedPasswordHistoryCount) { "PASS" } else { "CHECK" }
    },
    [PSCustomObject]@{
        Setting = "LockoutThreshold"
        Expected = $ExpectedLockoutThreshold
        Actual = $Policy.LockoutThreshold
        Status = if ($Policy.LockoutThreshold -eq $ExpectedLockoutThreshold) { "PASS" } else { "CHECK" }
    },
    [PSCustomObject]@{
        Setting = "LockoutDurationMinutes"
        Expected = $ExpectedLockoutDurationMinutes
        Actual = [int]$Policy.LockoutDuration.TotalMinutes
        Status = if ([int]$Policy.LockoutDuration.TotalMinutes -eq $ExpectedLockoutDurationMinutes) { "PASS" } else { "CHECK" }
    },
    [PSCustomObject]@{
        Setting = "LockoutObservationWindowMinutes"
        Expected = $ExpectedLockoutObservationWindowMinutes
        Actual = [int]$Policy.LockoutObservationWindow.TotalMinutes
        Status = if ([int]$Policy.LockoutObservationWindow.TotalMinutes -eq $ExpectedLockoutObservationWindowMinutes) { "PASS" } else { "CHECK" }
    }
)

Write-Host "Domain policy verification:" -ForegroundColor Cyan
$PolicyReport | Format-Table -AutoSize

Write-Host ""
Write-Host "Account verification:" -ForegroundColor Cyan

$user = Get-ADUser -Identity $SamAccountName -Properties Enabled,LockedOut,AccountExpirationDate,PasswordLastSet,PasswordExpired,PasswordNeverExpires,Department,Title,DistinguishedName,UserPrincipalName -ErrorAction SilentlyContinue

if (-not $user) {
    $UserReport = [PSCustomObject]@{
        Status = "MISSING"
        SamAccountName = $SamAccountName
        Enabled = "N/A"
        LockedOut = "N/A"
        PasswordNeverExpires = "N/A"
        AccountExpirationDate = "N/A"
    }
}
else {
    $UserReport = [PSCustomObject]@{
        Status = if ($user.Enabled -and -not $user.PasswordNeverExpires) { "PASS" } else { "CHECK" }
        SamAccountName = $user.SamAccountName
        Enabled = $user.Enabled
        LockedOut = $user.LockedOut
        PasswordNeverExpires = $user.PasswordNeverExpires
        AccountExpirationDate = $user.AccountExpirationDate
        Department = $user.Department
        Title = $user.Title
        DistinguishedName = $user.DistinguishedName
    }
}

$UserReport | Format-List

$IssueCount = ($PolicyReport | Where-Object { $_.Status -ne "PASS" }).Count
if ($UserReport.Status -ne "PASS") {
    $IssueCount++
}

Write-Host ""
if ($IssueCount -eq 0) {
    Write-Host "Verification complete: Lab 09 policy and account controls match the expected lab state." -ForegroundColor Green
}
else {
    Write-Host "Verification complete: $IssueCount item(s) require review." -ForegroundColor Yellow
    Write-Host "Run configure-lab09-password-lockout-policy.ps1 and create-lab09-lockout-test-user.ps1 again if needed." -ForegroundColor Yellow
}
