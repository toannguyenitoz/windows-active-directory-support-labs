# Lab 07 - Active Directory User Management

## Overview

This lab creates and manages domain user accounts in Active Directory.

## Objectives

- Create a new domain user.
- Configure user properties.
- Test domain sign-in.
- Disable and enable a user account.

## Example User

| Field | Example |
|---|---|
| First name | John |
| Last name | Smith |
| Sign-in name | `j.smith` |
| Department | IT Support |

## Steps

1. Open Active Directory Users and Computers.
2. Go to the Users OU.
3. Create a new user account.
4. Enter first name, last name and sign-in name.
5. Set a lab password.
6. Choose whether the account must change password at next logon.
7. Open the user properties.
8. Add department, office and description information.
9. Test sign-in from the Windows 11 client.
10. Disable the account and confirm the user cannot sign in.
11. Enable the account again and confirm access is restored.

## Optional PowerShell Checks

Run `Get-ADUser j.smith -Properties *` to review the account.

## Screenshot Files

- `01-create-new-user.png`
- `02-user-account-details.png`
- `03-user-properties-general-tab.png`
- `04-domain-login-test.png`
- `05-disable-enable-user-account.png`

## Checklist

- [ ] New user created
- [ ] User properties configured
- [ ] Domain sign-in tested
- [ ] Disable account tested
- [ ] Enable account tested

[Previous Lab](../06-active-directory-ou-structure/README.md) | [Main README](../../README.md) | [Next Lab](../08-active-directory-group-management/README.md)
