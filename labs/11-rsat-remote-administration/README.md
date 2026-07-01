<a id="top"></a>

# Lab 11 — RSAT Remote Administration

<p align="center">
  <img src="https://img.shields.io/badge/Windows%2011-RSAT-0078D4?logo=windows&logoColor=white" alt="RSAT">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-green" alt="IT Support">
  <img src="https://img.shields.io/badge/Level-Intermediate-orange" alt="Intermediate">
</p>

<p align="center">
  <a href="../10-home-folder-and-file-share/README.md">Previous Lab</a> | <a href="../../README.md">Main README</a> | <a href="../12-second-client-computer-management/README.md">Next Lab</a>
</p>

---

## Overview

This lab explains how to use Remote Server Administration Tools from a Windows 11 client.

RSAT allows support staff and administrators to manage Windows Server roles from a workstation instead of signing in directly to the server for every task.

---

## Objectives

- Install RSAT tools on Windows 11.
- Open Active Directory Users and Computers from the client.
- Confirm the domain can be managed from the workstation.
- Review a user or group object remotely.
- Understand why remote administration is useful.

---

## Lab Values Used in This Guide

| Item | Value |
|---|---|
| Admin workstation | `W11-CLIENT01` |
| Server | `SRV-DC01` |
| Domain | `corp.local` |
| Tool | RSAT Active Directory tools |

---

## Before You Start

The Windows 11 client must already be joined to the domain.

Sign in with a domain account that has permission to view or manage Active Directory objects.

---

## Step 1 — Open Optional Features

On the Windows 11 client, open:

```text
Settings > Apps > Optional features
```

Select:

```text
View features
```

Search for:

```text
RSAT
```

---

## Step 2 — Install Active Directory RSAT Tools

Install the RSAT feature for Active Directory administration.

The exact feature name may vary slightly by Windows version, but it normally includes:

```text
RSAT: Active Directory Domain Services and Lightweight Directory Services Tools
```

Wait for installation to finish.

---

## Step 3 — Open Windows Tools

Open:

```text
Start > Windows Tools
```

Find and open:

```text
Active Directory Users and Computers
```

This confirms that the tool is installed on the workstation.

---

## Step 4 — Browse the Domain

In Active Directory Users and Computers, confirm that the domain appears:

```text
corp.local
```

Browse to:

```text
Company > Users
Company > Groups
Company > Computers
```

---

## Step 5 — Review a User Object

Open the test user account:

```text
j.smith
```

Review the General, Account and Member Of tabs.

This proves that directory objects can be reviewed from the client workstation.

---

## Step 6 — Review a Group Object

Open:

```text
GG_StandardUsers
```

Review the Members tab.

Confirm the test user is listed as a member.

---

## Step 7 — Run a Command Check

Open PowerShell and run:

```powershell
Get-Command Get-ADUser
```

If the command is available, the Active Directory PowerShell module is installed.

Optional check:

```powershell
Get-ADDomain
```

---

## Completion Checklist

- [ ] Windows 11 client signed in with a domain account.
- [ ] RSAT searched from Optional Features.
- [ ] Active Directory RSAT tools installed.
- [ ] Active Directory Users and Computers opened from the client.
- [ ] Domain structure browsed from the client.
- [ ] User object reviewed.
- [ ] Group object reviewed.
- [ ] PowerShell command availability checked.

---

## Key Takeaways

- RSAT allows remote administration from a workstation.
- Support staff can review and manage directory objects without working directly on the server console.
- Remote tools should only be used by approved accounts with appropriate permissions.

---

<p align="center">
  <a href="../10-home-folder-and-file-share/README.md">Previous Lab</a> | <a href="../../README.md">Main README</a> | <a href="../12-second-client-computer-management/README.md">Next Lab</a> | <a href="#top">Back to Top</a>
</p>
