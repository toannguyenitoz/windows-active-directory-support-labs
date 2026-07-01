# Lab 08 - Active Directory Group Management

## Overview

This lab creates Active Directory groups and adds users to groups for easier access management.

## Objectives

- Create security groups.
- Understand group naming standards.
- Add and remove members.
- Confirm group membership.

## Suggested Groups

- `GG_ITSupport`
- `GG_StandardUsers`
- `DL_SharedData_Read`
- `DL_SharedData_Modify`

## Steps

1. Open Active Directory Users and Computers.
2. Go to the Groups OU.
3. Create a global security group named `GG_ITSupport`.
4. Create a global security group named `GG_StandardUsers`.
5. Open the group properties.
6. Add the test domain user to `GG_StandardUsers`.
7. Create domain local groups for future file share permissions.
8. Review the Members tab and Member Of tab.
9. Confirm group membership using the GUI.
10. Optionally check group membership using PowerShell.

## Optional PowerShell Checks

- `Get-ADGroup -Filter *`
- `Get-ADGroupMember GG_StandardUsers`

## Screenshot Files

- `01-create-global-security-group.png`
- `02-add-user-to-group.png`
- `03-group-members-tab.png`
- `04-user-member-of-tab.png`
- `05-powershell-group-check.png`

## Checklist

- [ ] Global security groups created
- [ ] Domain local groups created
- [ ] User added to group
- [ ] Membership confirmed
- [ ] Naming standard reviewed

[Previous Lab](../07-active-directory-user-management/README.md) | [Main README](../../README.md) | [Next Lab](../09-password-lockout-logon-controls/README.md)
