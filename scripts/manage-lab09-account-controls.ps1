<#
.SYNOPSIS
    Performs common Active Directory account support tasks for Lab 09.

.DESCRIPTION
    This script demonstrates common Service Desk / IT Support account actions:
    - Show account status
    - Reset password
    - Force password change at next logon
    - Unlock account
    - Disable account
    - Enable account
    - Set account expiration date
    - Clear account expiration date

    The script does not store passwords in the file.

.RUN ON
    Domain Controller: SRV-DC01

.EXAMPLES
    .\manage-lab09-account-controls.ps1 -Action Show -SamAccountName lockout.test
    .\manage-lab09-account-controls.ps1 -Action ResetPassword -SamAccountName lockout.test
    .\manage-lab09-account-controls.ps1 -Action Unlock -SamAccountName lockout.test
    .\manage-lab09-account-controls.ps1 -Action Disable -SamAccountName lockout.test
    .\manage-lab09-account-controls.ps1 -Action Enable -SamAccountName lockout.test
    .\manage-lab09-account-controls.ps1 -Action SetExpiry -SamAccountName lockout.test -ExpiryDate "2030-12-31"
    .\manage-lab09-account-controls.ps1 -Action ClearExpiry -SamAccountName lockout.test
#>

[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("Show", "ResetPassword", "ForcePasswordChange", "Unlock", "Disable", "Enable", "SetExpiry", "ClearExpiry")]
    [string]$Action,

    [string]$SamAccountName = "lockout.test",

    [datetime]$ExpiryDate
)

Import-Module ActiveDirectory -ErrorAction Stop

function Show-LabAccountState {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Identity
    )

    Get-ADUser -Identity $Identity `
        -Properties Enabled,LockedOut,AccountExpirationDate,PasswordLastSet,PasswordExpired,PasswordNeverExpires,LastLogonDate,BadLogonCount,Department,Title,DistinguishedName,UserPrincipalName |
        Select-Object `
            Name,
            SamAccountName,
            UserPrincipalName,
            Enabled,
            LockedOut,
            AccountExpirationDate,
            PasswordLastSet,
            PasswordExpired,
            PasswordNeverExpires,
            LastLogonDate,
            BadLogonCount,
            Department,
            Title,
            DistinguishedName |
        Format-List
}

$user = Get-ADUser -Identity $SamAccountName -ErrorAction SilentlyContinue
if (-not $user) {
    Write-Host "User not found: $SamAccountName" -ForegroundColor Red
    Write-Host "Run create-lab09-lockout-test-user.ps1 first, or provide an existing SamAccountName." -ForegroundColor Yellow
    return
}

Write-Host ""
Write-Host "Lab 09 - Account Control Management" -ForegroundColor Cyan
Write-Host "Action: $Action" -ForegroundColor Cyan
Write-Host "User: $SamAccountName" -ForegroundColor Cyan
Write-Host ""

switch ($Action) {
    "Show" {
        Show-LabAccountState -Identity $SamAccountName
    }

    "ResetPassword" {
        $NewPassword = Read-Host "Enter new temporary password" -AsSecureString

        if ($PSCmdlet.ShouldProcess($SamAccountName, "Reset password")) {
            Set-ADAccountPassword -Identity $SamAccountName -NewPassword $NewPassword -Reset -ErrorAction Stop
            Set-ADUser -Identity $SamAccountName -ChangePasswordAtLogon $true -ErrorAction Stop
            Write-Host "Password reset completed. User must change password at next logon." -ForegroundColor Green
        }
    }

    "ForcePasswordChange" {
        if ($PSCmdlet.ShouldProcess($SamAccountName, "Force password change at next logon")) {
            Set-ADUser -Identity $SamAccountName -ChangePasswordAtLogon $true -ErrorAction Stop
            Write-Host "Force password change enabled." -ForegroundColor Green
        }
    }

    "Unlock" {
        if ($PSCmdlet.ShouldProcess($SamAccountName, "Unlock account")) {
            Unlock-ADAccount -Identity $SamAccountName -ErrorAction Stop
            Write-Host "Account unlocked." -ForegroundColor Green
        }
    }

    "Disable" {
        if ($PSCmdlet.ShouldProcess($SamAccountName, "Disable account")) {
            Disable-ADAccount -Identity $SamAccountName -ErrorAction Stop
            Write-Host "Account disabled." -ForegroundColor Yellow
        }
    }

    "Enable" {
        if ($PSCmdlet.ShouldProcess($SamAccountName, "Enable account")) {
            Enable-ADAccount -Identity $SamAccountName -ErrorAction Stop
            Write-Host "Account enabled." -ForegroundColor Green
        }
    }

    "SetExpiry" {
        if (-not $PSBoundParameters.ContainsKey("ExpiryDate")) {
            Write-Host "ExpiryDate is required for SetExpiry. Example: -ExpiryDate '2030-12-31'" -ForegroundColor Red
            return
        }

        if ($PSCmdlet.ShouldProcess($SamAccountName, "Set account expiration date")) {
            Set-ADAccountExpiration -Identity $SamAccountName -DateTime $ExpiryDate -ErrorAction Stop
            Write-Host "Account expiration date set to: $ExpiryDate" -ForegroundColor Green
        }
    }

    "ClearExpiry" {
        if ($PSCmdlet.ShouldProcess($SamAccountName, "Clear account expiration date")) {
            Clear-ADAccountExpiration -Identity $SamAccountName -ErrorAction Stop
            Write-Host "Account expiration date cleared." -ForegroundColor Green
        }
    }
}

Write-Host ""
Write-Host "Current account state:" -ForegroundColor Cyan
Show-LabAccountState -Identity $SamAccountName
