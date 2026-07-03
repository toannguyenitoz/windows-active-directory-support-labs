<#
.SYNOPSIS
    Creates the Lab 06 Active Directory OU structure.

.DESCRIPTION
    This script creates a workplace-style OU structure for the lab company
    AdelaideTechSolutions under the current Active Directory domain.

    It is safe to run more than once. Existing OUs are detected and skipped.

.RUN ON
    Domain Controller: SRV-DC01

.EXAMPLE
    Set-ExecutionPolicy RemoteSigned -Scope Process
    .\create-lab06-ou-structure.ps1

.EXAMPLE
    .\create-lab06-ou-structure.ps1 -CompanyOU "AdelaideTechSolutions"
#>

[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [string]$CompanyOU = "AdelaideTechSolutions"
)

Import-Module ActiveDirectory -ErrorAction Stop

$DomainDN = (Get-ADDomain).DistinguishedName
$CreatedOUs = New-Object System.Collections.Generic.List[string]
$ExistingOUs = New-Object System.Collections.Generic.List[string]

function New-LabOU {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Name,

        [Parameter(Mandatory = $true)]
        [string]$Path
    )

    $existing = Get-ADOrganizationalUnit `
        -Filter "Name -eq '$Name'" `
        -SearchBase $Path `
        -SearchScope OneLevel `
        -ErrorAction SilentlyContinue

    if ($existing) {
        Write-Host "EXISTS: $Name under $Path" -ForegroundColor Yellow
        $ExistingOUs.Add("OU=$Name,$Path") | Out-Null
        return
    }

    if ($PSCmdlet.ShouldProcess("OU=$Name,$Path", "Create Active Directory OU")) {
        New-ADOrganizationalUnit `
            -Name $Name `
            -Path $Path `
            -ProtectedFromAccidentalDeletion $true `
            -ErrorAction Stop

        Write-Host "CREATED: $Name under $Path" -ForegroundColor Green
        $CreatedOUs.Add("OU=$Name,$Path") | Out-Null
    }
}

Write-Host ""
Write-Host "Lab 06 - Create Active Directory OU Structure" -ForegroundColor Cyan
Write-Host "Domain DN: $DomainDN" -ForegroundColor Cyan
Write-Host "Company OU: $CompanyOU" -ForegroundColor Cyan
Write-Host ""

# Root company OU
New-LabOU -Name $CompanyOU -Path $DomainDN
$CompanyPath = "OU=$CompanyOU,$DomainDN"

# Core OUs
$CoreOUs = @(
    "Users",
    "Computers",
    "Groups",
    "ServiceAccounts",
    "Departments"
)

foreach ($ou in $CoreOUs) {
    New-LabOU -Name $ou -Path $CompanyPath
}

# Department OUs
$DepartmentPath = "OU=Departments,$CompanyPath"
$DepartmentOUs = @(
    "IT",
    "HR",
    "Finance",
    "Sales",
    "Operations"
)

foreach ($ou in $DepartmentOUs) {
    New-LabOU -Name $ou -Path $DepartmentPath
}

# User management OUs
$UsersPath = "OU=Users,$CompanyPath"
$UserOUs = @(
    "StandardUsers",
    "AdminUsers",
    "DisabledUsers"
)

foreach ($ou in $UserOUs) {
    New-LabOU -Name $ou -Path $UsersPath
}

# Computer management OUs
$ComputersPath = "OU=Computers,$CompanyPath"
$ComputerOUs = @(
    "Workstations",
    "Servers",
    "Laptops"
)

foreach ($ou in $ComputerOUs) {
    New-LabOU -Name $ou -Path $ComputersPath
}

# Group management OUs
$GroupsPath = "OU=Groups,$CompanyPath"
$GroupOUs = @(
    "SecurityGroups",
    "DistributionGroups"
)

foreach ($ou in $GroupOUs) {
    New-LabOU -Name $ou -Path $GroupsPath
}

Write-Host ""
Write-Host "Lab 06 OU structure completed." -ForegroundColor Cyan
Write-Host "Created OUs:  $($CreatedOUs.Count)" -ForegroundColor Green
Write-Host "Existing OUs: $($ExistingOUs.Count)" -ForegroundColor Yellow
Write-Host ""
Write-Host "Next step: open Active Directory Users and Computers and refresh the domain tree." -ForegroundColor Cyan
