<#
.SYNOPSIS
    Performs common Active Directory group membership actions for Lab 08.

.DESCRIPTION
    This script demonstrates common IT Support / System Administration group tasks:
    - Show group members
    - Add a user or group to a group
    - Remove a user or group from a group
    - Show a user's group membership

.RUN ON
    Domain Controller: SRV-DC01

.EXAMPLES
    .\manage-lab08-group-membership.ps1 -Action ShowGroup -GroupName GG_All_StandardUsers
    .\manage-lab08-group-membership.ps1 -Action ShowUser -MemberName john.smith
    .\manage-lab08-group-membership.ps1 -Action AddMember -GroupName GG_IT_Support -MemberName john.smith
    .\manage-lab08-group-membership.ps1 -Action RemoveMember -GroupName GG_IT_Support -MemberName john.smith
#>

[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("ShowGroup", "ShowUser", "AddMember", "RemoveMember")]
    [string]$Action,

    [string]$GroupName,

    [string]$MemberName
)

Import-Module ActiveDirectory -ErrorAction Stop

function Get-LabADObject {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Name
    )

    Get-ADObject -LDAPFilter "(|(sAMAccountName=$Name)(cn=$Name)(name=$Name))" -Properties objectClass,sAMAccountName,displayName -ErrorAction SilentlyContinue |
        Select-Object -First 1
}

Write-Host ""
Write-Host "Lab 08 - Group Membership Management" -ForegroundColor Cyan
Write-Host "Action: $Action" -ForegroundColor Cyan
Write-Host ""

switch ($Action) {
    "ShowGroup" {
        if (-not $GroupName) {
            Write-Host "GroupName is required for ShowGroup." -ForegroundColor Red
            return
        }

        $group = Get-ADGroup -Identity $GroupName -Properties Description,GroupScope,GroupCategory,DistinguishedName -ErrorAction SilentlyContinue
        if (-not $group) {
            Write-Host "Group not found: $GroupName" -ForegroundColor Red
            return
        }

        Write-Host "Group details:" -ForegroundColor Cyan
        $group | Select-Object Name,GroupScope,GroupCategory,Description,DistinguishedName | Format-List

        Write-Host "Members:" -ForegroundColor Cyan
        Get-ADGroupMember -Identity $GroupName -Recursive:$false |
            Select-Object Name,SamAccountName,ObjectClass,DistinguishedName |
            Sort-Object Name |
            Format-Table -AutoSize
    }

    "ShowUser" {
        if (-not $MemberName) {
            Write-Host "MemberName is required for ShowUser." -ForegroundColor Red
            return
        }

        $user = Get-ADUser -Identity $MemberName -Properties MemberOf,Department,Title,Enabled,DistinguishedName -ErrorAction SilentlyContinue
        if (-not $user) {
            Write-Host "User not found: $MemberName" -ForegroundColor Red
            return
        }

        Write-Host "User details:" -ForegroundColor Cyan
        $user | Select-Object Name,SamAccountName,Enabled,Department,Title,DistinguishedName | Format-List

        Write-Host "Group membership:" -ForegroundColor Cyan
        Get-ADPrincipalGroupMembership -Identity $MemberName |
            Select-Object Name,GroupScope,GroupCategory |
            Sort-Object Name |
            Format-Table -AutoSize
    }

    "AddMember" {
        if (-not $GroupName -or -not $MemberName) {
            Write-Host "GroupName and MemberName are required for AddMember." -ForegroundColor Red
            return
        }

        $group = Get-ADGroup -Identity $GroupName -ErrorAction SilentlyContinue
        $member = Get-LabADObject -Name $MemberName

        if (-not $group) {
            Write-Host "Group not found: $GroupName" -ForegroundColor Red
            return
        }
        if (-not $member) {
            Write-Host "Member not found: $MemberName" -ForegroundColor Red
            return
        }

        if ($PSCmdlet.ShouldProcess($GroupName, "Add member $MemberName")) {
            Add-ADGroupMember -Identity $GroupName -Members $member.DistinguishedName -ErrorAction Stop
            Write-Host "Added $MemberName to $GroupName." -ForegroundColor Green
        }
    }

    "RemoveMember" {
        if (-not $GroupName -or -not $MemberName) {
            Write-Host "GroupName and MemberName are required for RemoveMember." -ForegroundColor Red
            return
        }

        $group = Get-ADGroup -Identity $GroupName -ErrorAction SilentlyContinue
        $member = Get-LabADObject -Name $MemberName

        if (-not $group) {
            Write-Host "Group not found: $GroupName" -ForegroundColor Red
            return
        }
        if (-not $member) {
            Write-Host "Member not found: $MemberName" -ForegroundColor Red
            return
        }

        if ($PSCmdlet.ShouldProcess($GroupName, "Remove member $MemberName")) {
            Remove-ADGroupMember -Identity $GroupName -Members $member.DistinguishedName -Confirm:$false -ErrorAction Stop
            Write-Host "Removed $MemberName from $GroupName." -ForegroundColor Yellow
        }
    }
}
