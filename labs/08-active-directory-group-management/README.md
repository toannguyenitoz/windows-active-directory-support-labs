<a id="top"></a>

# Lab 08 — Active Directory Group Management

<p align="center">
  <img src="https://img.shields.io/badge/Active%20Directory-Groups-6A1B9A" alt="Active Directory">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-green" alt="IT Support">
  <img src="https://img.shields.io/badge/Level-Intermediate-orange" alt="Intermediate">
</p>

<p align="center">
  <a href="../07-active-directory-user-management/README.md">Previous Lab</a> | <a href="../../README.md">Main README</a> | <a href="../09-password-lockout-logon-controls/README.md">Next Lab</a>
</p>

---

## Overview

This lab explains how to create and manage Active Directory groups.

Groups make access management easier because permissions can be assigned to groups instead of individual users. This is a common workplace practice for file shares, printers, applications and administrative access.

---

## Objectives

- Create security groups in the correct OU.
- Apply a simple group naming standard.
- Add users to groups.
- Review group membership from both the group and user view.
- Confirm group membership using a command.

---

## Example Groups Used in This Guide

| Group | Purpose |
|---|---|
| `GG_ITSupport` | Global group for IT Support users |
| `GG_StandardUsers` | Global group for standard domain users |
| `DL_SharedData_Read` | Domain local group for read access |
| `DL_SharedData_Modify` | Domain local group for modify access |

> `GG` means Global Group and `DL` means Domain Local Group. This naming style helps readers understand group purpose quickly.

---

## Before You Start

Complete the user management lab first.

Confirm that the `Groups` OU exists:

```text
Company > Groups
```

Confirm that the test user exists:

```text
j.smith
```

---

## Step 1 — Open the Groups OU

Open:

```text
Server Manager > Tools > Active Directory Users and Computers
```

Browse to:

```text
corp.local > Company > Groups
```

---

## Step 2 — Create a Global Security Group

Right-click the `Groups` OU and select:

```text
New > Group
```

Create:

```text
GG_StandardUsers
```

Use these options:

```text
Group scope: Global
Group type: Security
```

---

## Step 3 — Create an IT Support Group

Create another group:

```text
GG_ITSupport
```

Use the same type:

```text
Global Security
```

This group can be used later for support or administration scenarios.

---

## Step 4 — Add a User to a Group

Open the properties of:

```text
GG_StandardUsers
```

Go to the Members tab and add:

```text
j.smith
```

This grants the user membership in the group.

---

## Step 5 — Review the User Member Of Tab

Open the properties of the user account:

```text
j.smith
```

Go to:

```text
Member Of
```

Confirm that `GG_StandardUsers` appears in the list.

---

## Step 6 — Confirm Group Membership with PowerShell

Run:

```powershell
Get-ADGroupMember GG_StandardUsers
```

The test user should appear in the command output.

---

## Step 7 — Create Access Groups for Later Labs

Create these groups for the file share lab:

```text
DL_SharedData_Read
DL_SharedData_Modify
```

These groups will be used later to demonstrate access control.

---

## Completion Checklist

- [ ] Groups OU opened.
- [ ] `GG_StandardUsers` created.
- [ ] `GG_ITSupport` created.
- [ ] Test user added to a group.
- [ ] User membership reviewed.
- [ ] Group membership confirmed with PowerShell.
- [ ] Domain local groups created for later labs.

---

## Key Takeaways

- Groups make permission management easier and cleaner.
- Naming standards help support staff understand group purpose.
- User membership can be checked from both the user object and the group object.

---

<p align="center">
  <a href="../07-active-directory-user-management/README.md">Previous Lab</a> | <a href="../../README.md">Main README</a> | <a href="../09-password-lockout-logon-controls/README.md">Next Lab</a> | <a href="#top">Back to Top</a>
</p>
