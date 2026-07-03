<#
.SYNOPSIS
    Creates a dedicated Active Directory test user for Lab 09.

.DESCRIPTION
    This script creates or updates a lab account named lockout.test. The account
    is used for password reset, disable/enable, unlock and logon control practice.

    The script does not store passwords in the file. A temporary password is
    entered securely at runtime.

.RUN ON
    Domain Controller: SRV-DC01

.REQUIREMENTS
    Lab 06 OU structure must already exist.

.EXAMPLE
    Set-ExecutionPolicy RemoteSigned -Scope Process
    Set-Location .\scripts
    .\create-lab09-lockout-test-user.ps1
#>

[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [string]$CompanyOU = "AdelaideTechSolutions",
    [string]$SamAccountName = "lockout.test"
)

Import-Module ActiveDirectory -ErrorAction Stop

$Domain = Get-ADDomain
$DomainDN = $Domain.DistinguishedName
$DnsRoot = $Domain.DNSRoot
$CompanyPath = "OU=$CompanyOU,$DomainDN"
$TargetOU = "OU=StandardUsers,OU=Users,$CompanyPath"

Write-Host ""
Write-Host "Lab 09 - Create Lockout Test User" -ForegroundColor Cyan
Write-Host "Domain: $DnsRoot" -ForegroundColor Cyan
Write-Host "Target OU: $TargetOU" -ForegroundColor Cyan
Write-Host ""

$TargetExists = Get-ADOrganizationalUnit -Identity $TargetOU -ErrorAction SilentlyContinue
if (-not $TargetExists) {
    Write-Host "Required OU not found: $TargetOU" -ForegroundColor Red
    Write-Host "Run the Lab 06 OU creation script first." -ForegroundColor Yellow
    return
}

$TemporaryPassword = Read-Host "Enter temporary password for $SamAccountName" -AsSecureString
$UserPrincipalName = "$SamAccountName@$DnsRoot"
$DisplayName = "Lockout Test User"

$ExistingUser = Get-ADUser -Filter "SamAccountName -eq '$SamAccountName'" -Properties DistinguishedName -ErrorAction SilentlyContinue

if ($ExistingUser) {
    Write-Host "EXISTS: $SamAccountName - updating user properties" -ForegroundColor Yellow

    if ($PSCmdlet.ShouldProcess($SamAccountName, "Update lockout test user")) {
        Set-ADUser -Identity $SamAccountName `
            -GivenName "Lockout" `
            -Surname "Test User" `
            -DisplayName $DisplayName `
            -UserPrincipalName $UserPrincipalName `
            -Department "IT" `
            -Title "Account Lockout Test User" `
            -Description "Lab 09 test user for password reset, lockout and logon control practice" `
            -ChangePasswordAtLogon $false `
            -AccountExpirationDate $null `
            -ErrorAction Stop

        Set-ADAccountPassword -Identity $SamAccountName -NewPassword $TemporaryPassword -Reset -ErrorAction Stop
        Enable-ADAccount -Identity $SamAccountName -ErrorAction Stop
        Unlock-ADAccount -Identity $SamAccountName -ErrorAction SilentlyContinue

        if ($ExistingUser.DistinguishedName -notlike "CN=$DisplayName,$TargetOU") {
            Move-ADObject -Identity $ExistingUser.DistinguishedName -TargetPath $TargetOU -ErrorAction Stop
        }
    }
}
else {
    Write-Host "CREATING: $SamAccountName" -ForegroundColor Green

    if ($PSCmdlet.ShouldProcess($SamAccountName, "Create lockout test user")) {
        New-ADUser `
            -Name $DisplayName `
            -SamAccountName $SamAccountName `
            -UserPrincipalName $UserPrincipalName `
            -GivenName "Lockout" `
            -Surname "Test User" `
            -DisplayName $DisplayName `
            -Department "IT" `
            -Title "Account Lockout Test User" `
            -Description "Lab 09 test user for password reset, lockout and logon control practice" `
            -Path $TargetOU `
            -AccountPassword $TemporaryPassword `
            -Enabled $true `
            -ChangePasswordAtLogon $false `
            -PasswordNeverExpires $false `
            -ErrorAction Stop
    }
}

Write-Host ""
Write-Host "Current lockout test user state:" -ForegroundColor Cyan
Get-ADUser -Identity $SamAccountName -Properties Enabled,LockedOut,PasswordLastSet,PasswordExpired,Department,Title,DistinguishedName,UserPrincipalName |
    Select-Object Name,SamAccountName,UserPrincipalName,Enabled,LockedOut,PasswordLastSet,PasswordExpired,Department,Title,DistinguishedName |
    Format-List

Write-Host "Lab 09 lockout test user ready." -ForegroundColor Green
