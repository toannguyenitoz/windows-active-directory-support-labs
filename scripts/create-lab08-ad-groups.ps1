<#
.SYNOPSIS
    Creates sample Active Directory groups and memberships for Lab 08.

.DESCRIPTION
    This script creates workplace-style Active Directory groups under the Lab 06
    Groups OU structure. It also adds Lab 07 sample users to role groups and
    nests role groups into access groups.

    The script follows a simple AGDLP-style model:
    - Global groups hold user accounts.
    - Domain Local groups are used for access permissions.
    - Distribution groups are used for email-style grouping examples.

    It is safe to run more than once. Existing groups are detected and updated.

.RUN ON
    Domain Controller: SRV-DC01

.REQUIREMENTS
    Lab 06 OU structure must already exist.
    Lab 07 users should already exist.

.EXAMPLE
    Set-ExecutionPolicy RemoteSigned -Scope Process
    Set-Location .\scripts
    .\create-lab08-ad-groups.ps1
#>

[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [string]$CompanyOU = "AdelaideTechSolutions"
)

Import-Module ActiveDirectory -ErrorAction Stop

$Domain = Get-ADDomain
$DomainDN = $Domain.DistinguishedName
$CompanyPath = "OU=$CompanyOU,$DomainDN"
$SecurityGroupsOU = "OU=SecurityGroups,OU=Groups,$CompanyPath"
$DistributionGroupsOU = "OU=DistributionGroups,OU=Groups,$CompanyPath"

Write-Host ""
Write-Host "Lab 08 - Create Active Directory Groups" -ForegroundColor Cyan
Write-Host "Domain: $($Domain.DNSRoot)" -ForegroundColor Cyan
Write-Host "Company OU: $CompanyOU" -ForegroundColor Cyan
Write-Host ""

$RequiredOUs = @($SecurityGroupsOU, $DistributionGroupsOU)
foreach ($ou in $RequiredOUs) {
    $exists = Get-ADOrganizationalUnit -Identity $ou -ErrorAction SilentlyContinue
    if (-not $exists) {
        Write-Host "Required OU not found: $ou" -ForegroundColor Red
        Write-Host "Run the Lab 06 OU creation script first." -ForegroundColor Yellow
        return
    }
}

$GroupDefinitions = @(
    [PSCustomObject]@{
        Name = "GG_All_StandardUsers"
        Scope = "Global"
        Category = "Security"
        Path = $SecurityGroupsOU
        Description = "Lab 08 global security group for all standard users"
    },
    [PSCustomObject]@{
        Name = "GG_IT_Support"
        Scope = "Global"
        Category = "Security"
        Path = $SecurityGroupsOU
        Description = "Lab 08 global security group for IT support users"
    },
    [PSCustomObject]@{
        Name = "GG_HR_Users"
        Scope = "Global"
        Category = "Security"
        Path = $SecurityGroupsOU
        Description = "Lab 08 global security group for HR users"
    },
    [PSCustomObject]@{
        Name = "GG_Finance_Users"
        Scope = "Global"
        Category = "Security"
        Path = $SecurityGroupsOU
        Description = "Lab 08 global security group for Finance users"
    },
    [PSCustomObject]@{
        Name = "GG_Sales_Users"
        Scope = "Global"
        Category = "Security"
        Path = $SecurityGroupsOU
        Description = "Lab 08 global security group for Sales users"
    },
    [PSCustomObject]@{
        Name = "GG_Helpdesk_Admins"
        Scope = "Global"
        Category = "Security"
        Path = $SecurityGroupsOU
        Description = "Lab 08 global security group for Helpdesk admin users"
    },
    [PSCustomObject]@{
        Name = "DL_SharedData_Read"
        Scope = "DomainLocal"
        Category = "Security"
        Path = $SecurityGroupsOU
        Description = "Lab 08 domain local group for read access to SharedData"
    },
    [PSCustomObject]@{
        Name = "DL_SharedData_Modify"
        Scope = "DomainLocal"
        Category = "Security"
        Path = $SecurityGroupsOU
        Description = "Lab 08 domain local group for modify access to SharedData"
    },
    [PSCustomObject]@{
        Name = "DG_AllStaff"
        Scope = "Global"
        Category = "Distribution"
        Path = $DistributionGroupsOU
        Description = "Lab 08 distribution group for all staff"
    },
    [PSCustomObject]@{
        Name = "DG_ITTeam"
        Scope = "Global"
        Category = "Distribution"
        Path = $DistributionGroupsOU
        Description = "Lab 08 distribution group for IT team members"
    }
)

function New-LabGroup {
    param(
        [Parameter(Mandatory = $true)]
        [object]$GroupDefinition
    )

    $existingGroup = Get-ADGroup -Filter "Name -eq '$($GroupDefinition.Name)'" -ErrorAction SilentlyContinue

    if ($existingGroup) {
        Write-Host "EXISTS: $($GroupDefinition.Name) - updating description" -ForegroundColor Yellow
        if ($PSCmdlet.ShouldProcess($GroupDefinition.Name, "Update AD group description")) {
            Set-ADGroup -Identity $GroupDefinition.Name -Description $GroupDefinition.Description -ErrorAction Stop
        }
        return
    }

    Write-Host "CREATING: $($GroupDefinition.Name)" -ForegroundColor Green
    if ($PSCmdlet.ShouldProcess($GroupDefinition.Name, "Create AD group")) {
        New-ADGroup `
            -Name $GroupDefinition.Name `
            -SamAccountName $GroupDefinition.Name `
            -GroupScope $GroupDefinition.Scope `
            -GroupCategory $GroupDefinition.Category `
            -Path $GroupDefinition.Path `
            -Description $GroupDefinition.Description `
            -ErrorAction Stop
    }
}

function Add-LabGroupMember {
    param(
        [Parameter(Mandatory = $true)]
        [string]$GroupName,

        [Parameter(Mandatory = $true)]
        [string]$MemberName
    )

    $group = Get-ADGroup -Identity $GroupName -ErrorAction SilentlyContinue
    if (-not $group) {
        Write-Host "Group not found: $GroupName" -ForegroundColor Red
        return
    }

    $member = Get-ADObject -LDAPFilter "(|(sAMAccountName=$MemberName)(cn=$MemberName)(name=$MemberName))" -ErrorAction SilentlyContinue | Select-Object -First 1
    if (-not $member) {
        Write-Host "Member not found: $MemberName" -ForegroundColor Yellow
        return
    }

    $alreadyMember = Get-ADGroupMember -Identity $GroupName -Recursive:$false -ErrorAction SilentlyContinue |
        Where-Object { $_.DistinguishedName -eq $member.DistinguishedName }

    if ($alreadyMember) {
        Write-Host "MEMBER EXISTS: $MemberName in $GroupName" -ForegroundColor Yellow
        return
    }

    if ($PSCmdlet.ShouldProcess($GroupName, "Add member $MemberName")) {
        Add-ADGroupMember -Identity $GroupName -Members $member.DistinguishedName -ErrorAction Stop
        Write-Host "ADDED: $MemberName to $GroupName" -ForegroundColor Green
    }
}

foreach ($groupDefinition in $GroupDefinitions) {
    New-LabGroup -GroupDefinition $groupDefinition
}

Write-Host ""
Write-Host "Adding user memberships..." -ForegroundColor Cyan

$UserMemberships = @(
    [PSCustomObject]@{ Group = "GG_All_StandardUsers"; Member = "john.smith" },
    [PSCustomObject]@{ Group = "GG_All_StandardUsers"; Member = "mary.johnson" },
    [PSCustomObject]@{ Group = "GG_All_StandardUsers"; Member = "david.lee" },
    [PSCustomObject]@{ Group = "GG_All_StandardUsers"; Member = "sarah.brown" },
    [PSCustomObject]@{ Group = "GG_IT_Support"; Member = "john.smith" },
    [PSCustomObject]@{ Group = "GG_HR_Users"; Member = "mary.johnson" },
    [PSCustomObject]@{ Group = "GG_Finance_Users"; Member = "david.lee" },
    [PSCustomObject]@{ Group = "GG_Sales_Users"; Member = "sarah.brown" },
    [PSCustomObject]@{ Group = "GG_Helpdesk_Admins"; Member = "admin.helpdesk" },
    [PSCustomObject]@{ Group = "DG_AllStaff"; Member = "john.smith" },
    [PSCustomObject]@{ Group = "DG_AllStaff"; Member = "mary.johnson" },
    [PSCustomObject]@{ Group = "DG_AllStaff"; Member = "david.lee" },
    [PSCustomObject]@{ Group = "DG_AllStaff"; Member = "sarah.brown" },
    [PSCustomObject]@{ Group = "DG_ITTeam"; Member = "john.smith" },
    [PSCustomObject]@{ Group = "DG_ITTeam"; Member = "admin.helpdesk" }
)

foreach ($membership in $UserMemberships) {
    Add-LabGroupMember -GroupName $membership.Group -MemberName $membership.Member
}

Write-Host ""
Write-Host "Adding nested AGDLP-style group memberships..." -ForegroundColor Cyan

$NestedMemberships = @(
    [PSCustomObject]@{ Group = "DL_SharedData_Read"; Member = "GG_All_StandardUsers" },
    [PSCustomObject]@{ Group = "DL_SharedData_Modify"; Member = "GG_IT_Support" },
    [PSCustomObject]@{ Group = "DL_SharedData_Modify"; Member = "GG_Helpdesk_Admins" }
)

foreach ($membership in $NestedMemberships) {
    Add-LabGroupMember -GroupName $membership.Group -MemberName $membership.Member
}

Write-Host ""
Write-Host "Lab 08 group creation and membership setup completed." -ForegroundColor Cyan
Write-Host ""
Write-Host "Created or updated groups:" -ForegroundColor Cyan

Get-ADGroup -Filter * -SearchBase "OU=Groups,$CompanyPath" -Properties GroupScope,GroupCategory,Description |
    Select-Object Name,GroupScope,GroupCategory,Description |
    Sort-Object Name |
    Format-Table -AutoSize
