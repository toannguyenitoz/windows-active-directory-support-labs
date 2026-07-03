<#
.SYNOPSIS
    Configures a lab password and account lockout policy for Lab 09.

.DESCRIPTION
    This script updates the default domain password and account lockout policy
    for a lab Active Directory domain. It is intended for a test environment only.

    The script does not use local drive paths and can be run from any cloned
    repository location.

.RUN ON
    Domain Controller: SRV-DC01

.EXAMPLE
    Set-ExecutionPolicy RemoteSigned -Scope Process
    Set-Location .\scripts
    .\configure-lab09-password-lockout-policy.ps1

.EXAMPLE
    .\configure-lab09-password-lockout-policy.ps1 -MinPasswordLength 12 -LockoutThreshold 5
#>

[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [int]$MinPasswordLength = 10,
    [int]$PasswordHistoryCount = 5,
    [int]$MaxPasswordAgeDays = 90,
    [int]$MinPasswordAgeDays = 0,
    [int]$LockoutThreshold = 5,
    [int]$LockoutDurationMinutes = 15,
    [int]$LockoutObservationWindowMinutes = 15
)

Import-Module ActiveDirectory -ErrorAction Stop

$Domain = Get-ADDomain
$DomainDN = $Domain.DistinguishedName

Write-Host ""
Write-Host "Lab 09 - Configure Password and Account Lockout Policy" -ForegroundColor Cyan
Write-Host "Domain: $($Domain.DNSRoot)" -ForegroundColor Cyan
Write-Host "Domain DN: $DomainDN" -ForegroundColor Cyan
Write-Host ""

$PolicySettings = @{
    ComplexityEnabled        = $true
    MinPasswordLength        = $MinPasswordLength
    PasswordHistoryCount     = $PasswordHistoryCount
    MaxPasswordAge           = New-TimeSpan -Days $MaxPasswordAgeDays
    MinPasswordAge           = New-TimeSpan -Days $MinPasswordAgeDays
    LockoutThreshold         = $LockoutThreshold
    LockoutDuration          = New-TimeSpan -Minutes $LockoutDurationMinutes
    LockoutObservationWindow = New-TimeSpan -Minutes $LockoutObservationWindowMinutes
}

if ($PSCmdlet.ShouldProcess($DomainDN, "Update default domain password and lockout policy")) {
    Set-ADDefaultDomainPasswordPolicy `
        -Identity $DomainDN `
        -ComplexityEnabled $PolicySettings.ComplexityEnabled `
        -MinPasswordLength $PolicySettings.MinPasswordLength `
        -PasswordHistoryCount $PolicySettings.PasswordHistoryCount `
        -MaxPasswordAge $PolicySettings.MaxPasswordAge `
        -MinPasswordAge $PolicySettings.MinPasswordAge `
        -LockoutThreshold $PolicySettings.LockoutThreshold `
        -LockoutDuration $PolicySettings.LockoutDuration `
        -LockoutObservationWindow $PolicySettings.LockoutObservationWindow `
        -ErrorAction Stop
}

Write-Host ""
Write-Host "Current default domain password and lockout policy:" -ForegroundColor Cyan

Get-ADDefaultDomainPasswordPolicy |
    Select-Object `
        ComplexityEnabled,
        MinPasswordLength,
        PasswordHistoryCount,
        MaxPasswordAge,
        MinPasswordAge,
        LockoutThreshold,
        LockoutDuration,
        LockoutObservationWindow |
    Format-List

Write-Host "Lab 09 policy configuration completed." -ForegroundColor Green
