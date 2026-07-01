# Lab 06 - Active Directory OU Structure

## Overview

This lab creates a clean Organizational Unit structure for users, computers and groups.

## Objectives

- Open Active Directory Users and Computers.
- Create top-level OUs.
- Create sub-OUs for common workplace objects.
- Move computer objects into the correct OU.

## Suggested OU Structure

- `Company`
- `Company/Users`
- `Company/Computers`
- `Company/Groups`
- `Company/Service Accounts`
- `Company/Disabled Accounts`

## Steps

1. Sign in to the domain controller.
2. Open Active Directory Users and Computers.
3. Right-click the domain name and create a new OU called `Company`.
4. Inside `Company`, create OUs for Users, Computers, Groups, Service Accounts and Disabled Accounts.
5. Find the Windows 11 client computer object.
6. Move the computer object into the Computers OU.
7. Refresh Active Directory Users and Computers and confirm the structure.

## Optional PowerShell Checks

Run `Get-ADOrganizationalUnit -Filter *` to list OUs.

## Screenshot Files

- `01-open-active-directory-users-and-computers.png`
- `02-create-company-ou.png`
- `03-create-sub-ous.png`
- `04-move-client-computer-object.png`
- `05-final-ou-structure.png`

## Checklist

- [ ] Company OU created
- [ ] User OU created
- [ ] Computer OU created
- [ ] Group OU created
- [ ] Client computer moved to correct OU

[Previous Lab](../05-join-windows-11-client-to-domain/README.md) | [Main README](../../README.md) | [Next Lab](../07-active-directory-user-management/README.md)
