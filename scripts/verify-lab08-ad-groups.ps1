<#
.SYNOPSIS
    Verifies Active Directory groups and memberships for Lab 08.

.DESCRIPTION
    This script checks whether the expected Lab 08 groups exist and whether key
    users/groups have been added as members.

.RUN ON
    Domain Controller: SRV-DC01

.EXAMPLE
    Set-Location .\scripts
    .\verify-lab08-ad-groups.ps1
#>

[CmdletBinding()]
param(
    [string]$CompanyOU = "AdelaideTechSolutions"
)

Import-Module ActiveDirectory -ErrorAction Stop

$Domain = Get-ADDomain
$DomainDN = $Domain.DistinguishedName
$CompanyPath = "OU=$CompanyOU,$DomainDN"
$SecurityGroupsOU = "OU=SecurityGroups,OU=Groups,$CompanyPath"
$DistributionGroupsOU = "OU=DistributionGroups,OU=Groups,$CompanyPath"

$ExpectedGroups = @(
    [PSCustomObject]@{ Name = "GG_All_StandardUsers"; Scope = "Global"; Category = "Security"; ExpectedOU = $SecurityGroupsOU },
    [PSCustomObject]@{ Name = "GG_IT_Support"; Scope = "Global"; Category = "Security"; ExpectedOU = $SecurityGroupsOU },
    [PSCustomObject]@{ Name = "GG_HR_Users"; Scope = "Global"; Category = "Security"; ExpectedOU = $SecurityGroupsOU },
    [PSCustomObject]@{ Name = "GG_Finance_Users"; Scope = "Global"; Category = "Security"; ExpectedOU = $SecurityGroupsOU },
    [PSCustomObject]@{ Name = "GG_Sales_Users"; Scope = "Global"; Category = "Security"; ExpectedOU = $SecurityGroupsOU },
    [PSCustomObject]@{ Name = "GG_Helpdesk_Admins"; Scope = "Global"; Category = "Security"; ExpectedOU = $SecurityGroupsOU },
    [PSCustomObject]@{ Name = "DL_SharedData_Read"; Scope = "DomainLocal"; Category = "Security"; ExpectedOU = $SecurityGroupsOU },
    [PSCustomObject]@{ Name = "DL_SharedData_Modify"; Scope = "DomainLocal"; Category = "Security"; ExpectedOU = $SecurityGroupsOU },
    [PSCustomObject]@{ Name = "DG_AllStaff"; Scope = "Global"; Category = "Distribution"; ExpectedOU = $DistributionGroupsOU },
    [PSCustomObject]@{ Name = "DG_ITTeam"; Scope = "Global"; Category = "Distribution"; ExpectedOU = $DistributionGroupsOU }
)

$ExpectedMemberships = @(
    [PSCustomObject]@{ Group = "GG_All_StandardUsers"; Member = "john.smith" },
    [PSCustomObject]@{ Group = "GG_All_StandardUsers"; Member = "mary.johnson" },
    [PSCustomObject]@{ Group = "GG_All_StandardUsers"; Member = "david.lee" },
    [PSCustomObject]@{ Group = "GG_All_StandardUsers"; Member = "sarah.brown" },
    [PSCustomObject]@{ Group = "GG_IT_Support"; Member = "john.smith" },
    [PSCustomObject]@{ Group = "GG_HR_Users"; Member = "mary.johnson" },
    [PSCustomObject]@{ Group = "GG_Finance_Users"; Member = "david.lee" },
    [PSCustomObject]@{ Group = "GG_Sales_Users"; Member = "sarah.brown" },
    [PSCustomObject]@{ Group = "GG_Helpdesk_Admins"; Member = "admin.helpdesk" },
    [PSCustomObject]@{ Group = "DL_SharedData_Read"; Member = "GG_All_StandardUsers" },
    [PSCustomObject]@{ Group = "DL_SharedData_Modify"; Member = "GG_IT_Support" },
    [PSCustomObject]@{ Group = "DL_SharedData_Modify"; Member = "GG_Helpdesk_Admins" },
    [PSCustomObject]@{ Group = "DG_AllStaff"; Member = "john.smith" },
    [PSCustomObject]@{ Group = "DG_ITTeam"; Member = "admin.helpdesk" }
)

Write-Host ""
Write-Host "Lab 08 - Verify Active Directory Groups" -ForegroundColor Cyan
Write-Host "Domain: $($Domain.DNSRoot)" -ForegroundColor Cyan
Write-Host "Company OU: $CompanyOU" -ForegroundColor Cyan
Write-Host ""

$GroupReport = foreach ($expected in $ExpectedGroups) {
    $group = Get-ADGroup -Identity $expected.Name -Properties GroupScope,GroupCategory,DistinguishedName -ErrorAction SilentlyContinue

    if (-not $group) {
        [PSCustomObject]@{
            Status = "MISSING"
            Name = $expected.Name
            Scope = "N/A"
            Category = "N/A"
            CorrectOU = "N/A"
        }
        continue
    }

    $correctScope = $group.GroupScope.ToString() -eq $expected.Scope
    $correctCategory = $group.GroupCategory.ToString() -eq $expected.Category
    $correctOU = $group.DistinguishedName -like "CN=$($expected.Name),$($expected.ExpectedOU)"
    $status = if ($correctScope -and $correctCategory -and $correctOU) { "PASS" } else { "CHECK" }

    [PSCustomObject]@{
        Status = $status
        Name = $group.Name
        Scope = $group.GroupScope
        Category = $group.GroupCategory
        CorrectOU = $correctOU
    }
}

Write-Host "Group verification:" -ForegroundColor Cyan
$GroupReport | Sort-Object Status,Name | Format-Table -AutoSize

$MembershipReport = foreach ($expected in $ExpectedMemberships) {
    $group = Get-ADGroup -Identity $expected.Group -ErrorAction SilentlyContinue
    $member = Get-ADObject -LDAPFilter "(|(sAMAccountName=$($expected.Member))(cn=$($expected.Member))(name=$($expected.Member)))" -ErrorAction SilentlyContinue | Select-Object -First 1

    if (-not $group -or -not $member) {
        [PSCustomObject]@{
            Status = "MISSING"
            Group = $expected.Group
            Member = $expected.Member
        }
        continue
    }

    $members = Get-ADGroupMember -Identity $expected.Group -Recursive:$false -ErrorAction SilentlyContinue
    $found = $members | Where-Object { $_.DistinguishedName -eq $member.DistinguishedName }
    $status = if ($found) { "PASS" } else { "CHECK" }

    [PSCustomObject]@{
        Status = $status
        Group = $expected.Group
        Member = $expected.Member
    }
}

Write-Host ""
Write-Host "Membership verification:" -ForegroundColor Cyan
$MembershipReport | Sort-Object Status,Group,Member | Format-Table -AutoSize

$IssueCount = (($GroupReport | Where-Object { $_.Status -ne "PASS" }).Count) + (($MembershipReport | Where-Object { $_.Status -ne "PASS" }).Count)

Write-Host ""
if ($IssueCount -eq 0) {
    Write-Host "Verification complete: all Lab 08 groups and key memberships are correct." -ForegroundColor Green
}
else {
    Write-Host "Verification complete: $IssueCount item(s) require review." -ForegroundColor Yellow
    Write-Host "Run create-lab08-ad-groups.ps1 again or check groups in ADUC." -ForegroundColor Yellow
}
