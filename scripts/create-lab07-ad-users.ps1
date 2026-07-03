<#
.SYNOPSIS
    Creates sample Active Directory users for Lab 07.

.DESCRIPTION
    This script creates workplace-style sample users under the Lab 06 OU structure.
    It supports repeatable lab practice by detecting existing users and updating them
    instead of creating duplicates.

    Users are placed into:
    - AdelaideTechSolutions > Users > StandardUsers
    - AdelaideTechSolutions > Users > AdminUsers
    - AdelaideTechSolutions > Users > DisabledUsers

.RUN ON
    Domain Controller: SRV-DC01

.REQUIREMENTS
    Lab 06 OU structure must already exist.

.EXAMPLE
    Set-ExecutionPolicy RemoteSigned -Scope Process
    .\create-lab07-ad-users.ps1

.NOTES
    Use in a lab environment only.
#>

[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [string]$CompanyOU = "AdelaideTechSolutions"
)

Import-Module ActiveDirectory -ErrorAction Stop

$Domain = Get-ADDomain
$DomainDN = $Domain.DistinguishedName
$DnsRoot = $Domain.DNSRoot
$CompanyPath = "OU=$CompanyOU,$DomainDN"

$StandardUsersOU = "OU=StandardUsers,OU=Users,$CompanyPath"
$AdminUsersOU = "OU=AdminUsers,OU=Users,$CompanyPath"
$DisabledUsersOU = "OU=DisabledUsers,OU=Users,$CompanyPath"

$RequiredOUs = @(
    $StandardUsersOU,
    $AdminUsersOU,
    $DisabledUsersOU
)

Write-Host ""
Write-Host "Lab 07 - Create Active Directory Users" -ForegroundColor Cyan
Write-Host "Domain: $DnsRoot" -ForegroundColor Cyan
Write-Host "Company OU: $CompanyOU" -ForegroundColor Cyan
Write-Host ""

foreach ($ou in $RequiredOUs) {
    $exists = Get-ADOrganizationalUnit -Identity $ou -ErrorAction SilentlyContinue
    if (-not $exists) {
        Write-Host "Required OU not found: $ou" -ForegroundColor Red
        Write-Host "Run the Lab 06 OU creation script first." -ForegroundColor Yellow
        return
    }
}

$InitialPassword = Read-Host "Enter temporary password for lab users" -AsSecureString

$Users = @(
    [PSCustomObject]@{
        SamAccountName = "john.smith"
        GivenName = "John"
        Surname = "Smith"
        DisplayName = "John Smith"
        Department = "IT"
        Title = "IT Support Technician"
        OU = $StandardUsersOU
        Enabled = $true
        ChangePasswordAtLogon = $true
        Description = "Lab 07 standard user - IT department"
    },
    [PSCustomObject]@{
        SamAccountName = "mary.johnson"
        GivenName = "Mary"
        Surname = "Johnson"
        DisplayName = "Mary Johnson"
        Department = "HR"
        Title = "HR Coordinator"
        OU = $StandardUsersOU
        Enabled = $true
        ChangePasswordAtLogon = $true
        Description = "Lab 07 standard user - HR department"
    },
    [PSCustomObject]@{
        SamAccountName = "david.lee"
        GivenName = "David"
        Surname = "Lee"
        DisplayName = "David Lee"
        Department = "Finance"
        Title = "Finance Officer"
        OU = $StandardUsersOU
        Enabled = $true
        ChangePasswordAtLogon = $true
        Description = "Lab 07 standard user - Finance department"
    },
    [PSCustomObject]@{
        SamAccountName = "sarah.brown"
        GivenName = "Sarah"
        Surname = "Brown"
        DisplayName = "Sarah Brown"
        Department = "Sales"
        Title = "Sales Representative"
        OU = $StandardUsersOU
        Enabled = $true
        ChangePasswordAtLogon = $true
        Description = "Lab 07 standard user - Sales department"
    },
    [PSCustomObject]@{
        SamAccountName = "admin.helpdesk"
        GivenName = "Helpdesk"
        Surname = "Admin"
        DisplayName = "Helpdesk Admin"
        Department = "IT"
        Title = "Helpdesk Administrator"
        OU = $AdminUsersOU
        Enabled = $true
        ChangePasswordAtLogon = $true
        Description = "Lab 07 admin user for delegated administration practice"
    },
    [PSCustomObject]@{
        SamAccountName = "former.user"
        GivenName = "Former"
        Surname = "User"
        DisplayName = "Former User"
        Department = "Operations"
        Title = "Former Employee"
        OU = $DisabledUsersOU
        Enabled = $false
        ChangePasswordAtLogon = $false
        Description = "Lab 07 disabled user example"
    }
)

function Set-LabUserState {
    param(
        [Parameter(Mandatory = $true)]
        [object]$UserDefinition
    )

    $Sam = $UserDefinition.SamAccountName
    $UPN = "$Sam@$DnsRoot"
    $ExistingUser = Get-ADUser -Filter "SamAccountName -eq '$Sam'" -Properties DistinguishedName -ErrorAction SilentlyContinue

    if ($ExistingUser) {
        Write-Host "EXISTS: $Sam - updating user properties" -ForegroundColor Yellow

        if ($PSCmdlet.ShouldProcess($Sam, "Update AD user properties")) {
            Set-ADUser -Identity $Sam `
                -GivenName $UserDefinition.GivenName `
                -Surname $UserDefinition.Surname `
                -DisplayName $UserDefinition.DisplayName `
                -UserPrincipalName $UPN `
                -Department $UserDefinition.Department `
                -Title $UserDefinition.Title `
                -Description $UserDefinition.Description `
                -ChangePasswordAtLogon $UserDefinition.ChangePasswordAtLogon `
                -ErrorAction Stop

            if ($ExistingUser.DistinguishedName -notlike "CN=$($UserDefinition.DisplayName),$($UserDefinition.OU)") {
                Move-ADObject -Identity $ExistingUser.DistinguishedName -TargetPath $UserDefinition.OU -ErrorAction Stop
                Write-Host "MOVED: $Sam to $($UserDefinition.OU)" -ForegroundColor Green
            }
        }
    }
    else {
        Write-Host "CREATING: $Sam" -ForegroundColor Green

        if ($PSCmdlet.ShouldProcess($Sam, "Create AD user")) {
            New-ADUser `
                -Name $UserDefinition.DisplayName `
                -SamAccountName $Sam `
                -UserPrincipalName $UPN `
                -GivenName $UserDefinition.GivenName `
                -Surname $UserDefinition.Surname `
                -DisplayName $UserDefinition.DisplayName `
                -Department $UserDefinition.Department `
                -Title $UserDefinition.Title `
                -Description $UserDefinition.Description `
                -Path $UserDefinition.OU `
                -AccountPassword $InitialPassword `
                -Enabled $UserDefinition.Enabled `
                -ChangePasswordAtLogon $UserDefinition.ChangePasswordAtLogon `
                -PasswordNeverExpires $false `
                -ErrorAction Stop
        }
    }

    if ($UserDefinition.Enabled) {
        Enable-ADAccount -Identity $Sam -ErrorAction SilentlyContinue
    }
    else {
        Disable-ADAccount -Identity $Sam -ErrorAction SilentlyContinue
    }
}

foreach ($user in $Users) {
    Set-LabUserState -UserDefinition $user
}

Write-Host ""
Write-Host "Lab 07 user creation completed." -ForegroundColor Cyan
Write-Host "Created or updated users:" -ForegroundColor Cyan

Get-ADUser -Filter * -SearchBase "OU=Users,$CompanyPath" -Properties Department,Title,Enabled |
    Select-Object Name,SamAccountName,Department,Title,Enabled |
    Sort-Object SamAccountName |
    Format-Table -AutoSize
