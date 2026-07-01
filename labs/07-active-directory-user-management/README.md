<a id="top"></a>

# Lab 07 — Active Directory User Management

<p align="center">
  <img src="https://img.shields.io/badge/Active%20Directory-Users-6A1B9A" alt="Active Directory">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-green" alt="IT Support">
  <img src="https://img.shields.io/badge/Level-Intermediate-orange" alt="Intermediate">
</p>

<p align="center">
  <a href="../06-active-directory-ou-structure/README.md">Previous Lab</a> | <a href="../../README.md">Main README</a> | <a href="../08-active-directory-group-management/README.md">Next Lab</a>
</p>

---

## Overview

This lab explains how to create and manage a domain user account in Active Directory.

User management is one of the most common tasks for IT Support and Service Desk teams. This lab focuses on creating a user, reviewing properties, testing sign-in and documenting the account clearly.

---

## Objectives

- Create a new domain user account.
- Configure basic user properties.
- Review account settings.
- Test domain sign-in from the Windows 11 client.
- Disable and enable a user account for support practice.

---

## Example User Used in This Guide

| Field | Example Value |
|---|---|
| First name | John |
| Last name | Smith |
| Username | `j.smith` |
| Department | IT Support |
| OU | `Company > Users` |

---

## Before You Start

Complete the OU structure lab first.

Confirm that the `Users` OU exists:

```text
Company > Users
```

---

## Step 1 — Open Active Directory Users and Computers

On the server, open:

```text
Server Manager > Tools > Active Directory Users and Computers
```

Browse to:

```text
corp.local > Company > Users
```

---

## Step 2 — Create a New User

Right-click the `Users` OU and select:

```text
New > User
```

Enter the user details:

```text
First name: John
Last name: Smith
User logon name: j.smith
```

Continue through the wizard and create the account.

---

## Step 3 — Review User Properties

Open the new user properties and review important fields:

```text
General
Account
Profile
Member Of
Organization
```

Add useful information such as department and description. Good account information helps future support staff identify the user and their role.

---

## Step 4 — Confirm the User Exists

Optional PowerShell check:

```powershell
Get-ADUser j.smith
```

This confirms the account can be found in Active Directory.

---

## Step 5 — Test Domain Sign-In

On the Windows 11 client, sign out and sign in using the new domain user.

Example format:

```text
CORP\j.smith
```

or:

```text
j.smith@corp.local
```

Confirm that the user can sign in successfully.

---

## Step 6 — Disable the Account for Testing

Back on the server, right-click the user account and choose the disable option.

Try signing in again from the client and observe the result.

This helps the reader understand how account status affects user access.

---

## Step 7 — Enable the Account Again

Enable the user account again from Active Directory Users and Computers.

Test sign-in again to confirm the account is usable.

---

## Completion Checklist

- [ ] `Users` OU located.
- [ ] New domain user created.
- [ ] User properties reviewed.
- [ ] Department or description added.
- [ ] User sign-in tested from Windows 11.
- [ ] Account disable behaviour reviewed.
- [ ] Account enabled again.

---

## Key Takeaways

- User accounts should be created in the correct OU.
- Clear user properties help IT Support understand account ownership and purpose.
- Disabling an account immediately prevents normal sign-in.
- Testing from the client confirms that directory changes are working.

---

<p align="center">
  <a href="../06-active-directory-ou-structure/README.md">Previous Lab</a> | <a href="../../README.md">Main README</a> | <a href="../08-active-directory-group-management/README.md">Next Lab</a> | <a href="#top">Back to Top</a>
</p>
