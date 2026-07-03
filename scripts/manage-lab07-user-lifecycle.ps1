<#
.SYNOPSIS
    Performs common Active Directory user management actions for Lab 07.

.DESCRIPTION
    This script demonstrates common IT Support / Service Desk user account tasks:
    - Show a user account
    - Disable a user account
    - Enable a user account
    - Reset a user password
    - Force password change at next logon

    It is designed for a lab environment and does not store passwords in the script.

.RUN ON
    Domain Controller: SRV-DC01

.EXAMPLES
    .\manage-lab07-user-lifecycle.ps1 -Action Show -SamAccountName john.smith
    .\manage-lab07-user-lifecycle.ps1 -Action Disable -SamAccountName former.user
    .\manage-lab07-user-lifecycle.ps1 -Action Enable -SamAccountName former.user
    .\manage-lab07-user-lifecycle.ps1 -Action ResetPassword -SamAccountName john.smith
    .\manage-lab07-user-lifecycle.ps1 -Action ForcePasswordChange -SamAccountName john.smith
#>

[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("Show", "Disable", "Enable", "ResetPassword", "ForcePasswordChange")]
    [string]$Action,

    [Parameter(Mandatory = $true)]
    [string]$SamAccountName
)

Import-Module ActiveDirectory -ErrorAction Stop

$user = Get-ADUser -Filter "SamAccountName -eq '$SamAccountName'" `
    -Properties Enabled,Department,Title,Description,DistinguishedName,PasswordLastSet,UserPrincipalName `
    -ErrorAction SilentlyContinue

if (-not $user) {
    Write-Host "User not found: $SamAccountName" -ForegroundColor Red
    return
}

Write-Host ""
Write-Host "Lab 07 - User Lifecycle Management" -ForegroundColor Cyan
Write-Host "Action: $Action" -ForegroundColor Cyan
Write-Host "User: $SamAccountName" -ForegroundColor Cyan
Write-Host ""

switch ($Action) {
    "Show" {
        $user |
            Select-Object Name,SamAccountName,UserPrincipalName,Enabled,Department,Title,PasswordLastSet,DistinguishedName |
            Format-List
    }

    "Disable" {
        if ($PSCmdlet.ShouldProcess($SamAccountName, "Disable AD account")) {
            Disable-ADAccount -Identity $SamAccountName -ErrorAction Stop
            Write-Host "Disabled account: $SamAccountName" -ForegroundColor Yellow
        }
    }

    "Enable" {
        if ($PSCmdlet.ShouldProcess($SamAccountName, "Enable AD account")) {
            Enable-ADAccount -Identity $SamAccountName -ErrorAction Stop
            Write-Host "Enabled account: $SamAccountName" -ForegroundColor Green
        }
    }

    "ResetPassword" {
        $NewPassword = Read-Host "Enter new temporary password" -AsSecureString

        if ($PSCmdlet.ShouldProcess($SamAccountName, "Reset AD account password")) {
            Set-ADAccountPassword -Identity $SamAccountName -NewPassword $NewPassword -Reset -ErrorAction Stop
            Set-ADUser -Identity $SamAccountName -ChangePasswordAtLogon $true -ErrorAction Stop
            Write-Host "Password reset completed for: $SamAccountName" -ForegroundColor Green
            Write-Host "User must change password at next logon: True" -ForegroundColor Green
        }
    }

    "ForcePasswordChange" {
        if ($PSCmdlet.ShouldProcess($SamAccountName, "Force password change at next logon")) {
            Set-ADUser -Identity $SamAccountName -ChangePasswordAtLogon $true -ErrorAction Stop
            Write-Host "Force password change enabled for: $SamAccountName" -ForegroundColor Green
        }
    }
}

Write-Host ""
Write-Host "Current account state:" -ForegroundColor Cyan
Get-ADUser -Identity $SamAccountName -Properties Enabled,Department,Title,Description,DistinguishedName,PasswordLastSet,UserPrincipalName |
    Select-Object Name,SamAccountName,UserPrincipalName,Enabled,Department,Title,PasswordLastSet,DistinguishedName |
    Format-List
