<#
.SYNOPSIS
    Verifies sample Active Directory users for Lab 07.

.DESCRIPTION
    Checks whether the expected Lab 07 users exist, whether they are in the
    correct OU, and whether their enabled/disabled state is correct.

.RUN ON
    Domain Controller: SRV-DC01

.EXAMPLE
    .\verify-lab07-ad-users.ps1
#>

[CmdletBinding()]
param(
    [string]$CompanyOU = "AdelaideTechSolutions"
)

Import-Module ActiveDirectory -ErrorAction Stop

$Domain = Get-ADDomain
$DomainDN = $Domain.DistinguishedName
$CompanyPath = "OU=$CompanyOU,$DomainDN"
$UsersRoot = "OU=Users,$CompanyPath"

$ExpectedUsers = @(
    [PSCustomObject]@{ SamAccountName = "john.smith";    ExpectedOU = "OU=StandardUsers,$UsersRoot"; ExpectedEnabled = $true  },
    [PSCustomObject]@{ SamAccountName = "mary.johnson";  ExpectedOU = "OU=StandardUsers,$UsersRoot"; ExpectedEnabled = $true  },
    [PSCustomObject]@{ SamAccountName = "david.lee";     ExpectedOU = "OU=StandardUsers,$UsersRoot"; ExpectedEnabled = $true  },
    [PSCustomObject]@{ SamAccountName = "sarah.brown";   ExpectedOU = "OU=StandardUsers,$UsersRoot"; ExpectedEnabled = $true  },
    [PSCustomObject]@{ SamAccountName = "admin.helpdesk";ExpectedOU = "OU=AdminUsers,$UsersRoot";    ExpectedEnabled = $true  },
    [PSCustomObject]@{ SamAccountName = "former.user";   ExpectedOU = "OU=DisabledUsers,$UsersRoot"; ExpectedEnabled = $false }
)

Write-Host ""
Write-Host "Lab 07 - Verify Active Directory Users" -ForegroundColor Cyan
Write-Host "Domain: $($Domain.DNSRoot)" -ForegroundColor Cyan
Write-Host "Company OU: $CompanyOU" -ForegroundColor Cyan
Write-Host ""

$Report = foreach ($expected in $ExpectedUsers) {
    $user = Get-ADUser -Filter "SamAccountName -eq '$($expected.SamAccountName)'" `
        -Properties DistinguishedName,Enabled,Department,Title,UserPrincipalName `
        -ErrorAction SilentlyContinue

    if (-not $user) {
        [PSCustomObject]@{
            Status = "MISSING"
            SamAccountName = $expected.SamAccountName
            Enabled = "N/A"
            CorrectOU = "N/A"
            Department = "N/A"
            Title = "N/A"
            DistinguishedName = $expected.ExpectedOU
        }
        continue
    }

    $CorrectOU = $user.DistinguishedName -like "CN=*,$($expected.ExpectedOU)"
    $CorrectEnabled = $user.Enabled -eq $expected.ExpectedEnabled

    $Status = if ($CorrectOU -and $CorrectEnabled) { "PASS" } else { "CHECK" }

    [PSCustomObject]@{
        Status = $Status
        SamAccountName = $user.SamAccountName
        Enabled = $user.Enabled
        CorrectOU = $CorrectOU
        Department = $user.Department
        Title = $user.Title
        DistinguishedName = $user.DistinguishedName
    }
}

$Report | Sort-Object Status,SamAccountName | Format-Table -AutoSize

$IssueCount = ($Report | Where-Object { $_.Status -ne "PASS" }).Count

Write-Host ""
if ($IssueCount -eq 0) {
    Write-Host "Verification complete: all Lab 07 users exist and match the expected state." -ForegroundColor Green
}
else {
    Write-Host "Verification complete: $IssueCount item(s) require review." -ForegroundColor Yellow
    Write-Host "Run create-lab07-ad-users.ps1 again or check the OU/user state in ADUC." -ForegroundColor Yellow
}
