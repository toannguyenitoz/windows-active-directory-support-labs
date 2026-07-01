<a id="top"></a>

# Lab 06 — Active Directory OU Structure

<p align="center">
  <img src="https://img.shields.io/badge/Active%20Directory-OU%20Design-6A1B9A" alt="Active Directory">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-green" alt="IT Support">
  <img src="https://img.shields.io/badge/Level-Intermediate-orange" alt="Intermediate">
</p>

<p align="center">
  <a href="../05-join-windows-11-client-to-domain/README.md">Previous Lab</a> | <a href="../../README.md">Main README</a> | <a href="../07-active-directory-user-management/README.md">Next Lab</a>
</p>

---

## Overview

This lab creates a clean Organizational Unit structure in Active Directory.

Organizational Units help administrators organize users, computers, groups and service accounts. A clear OU structure also makes Group Policy management easier in later administration tasks.

---

## Objectives

- Open Active Directory Users and Computers.
- Create a top-level OU for the lab organization.
- Create sub-OUs for users, computers, groups and service accounts.
- Move the Windows 11 computer object into the correct OU.
- Confirm the final OU structure.

---

## Suggested OU Structure

```text
corp.local
└── Company
    ├── Users
    ├── Computers
    ├── Groups
    ├── Service Accounts
    └── Disabled Accounts
```

---

## Before You Start

Complete the domain join lab first.

Confirm that the Windows 11 client computer object exists in Active Directory:

```text
Active Directory Users and Computers > Computers
```

---

## Step 1 — Open Active Directory Users and Computers

On the server, open:

```text
Server Manager > Tools > Active Directory Users and Computers
```

Expand the domain:

```text
corp.local
```

---

## Step 2 — Create the Top-Level OU

Right-click the domain name and create a new Organizational Unit.

Name it:

```text
Company
```

This becomes the main container for the lab objects.

---

## Step 3 — Create User and Computer OUs

Inside the `Company` OU, create:

```text
Users
Computers
```

The `Users` OU will store normal user accounts.

The `Computers` OU will store workstation computer objects.

---

## Step 4 — Create Group and Service Account OUs

Inside the `Company` OU, create:

```text
Groups
Service Accounts
Disabled Accounts
```

These OUs make administration clearer and reduce confusion as the lab grows.

---

## Step 5 — Move the Client Computer Object

Find the computer object:

```text
W11-CLIENT01
```

Move it into:

```text
Company > Computers
```

This keeps workstation objects separated from the default Computers container.

---

## Step 6 — Verify the OU Structure

Review the final structure in Active Directory Users and Computers.

Optional PowerShell check:

```powershell
Get-ADOrganizationalUnit -Filter *
```

Confirm that the new OUs are visible.

---

## Completion Checklist

- [ ] Active Directory Users and Computers opened.
- [ ] `Company` OU created.
- [ ] `Users` OU created.
- [ ] `Computers` OU created.
- [ ] `Groups` OU created.
- [ ] `Service Accounts` OU created.
- [ ] `Disabled Accounts` OU created.
- [ ] Client computer object moved to the correct OU.

---

## Key Takeaways

- OUs help organize directory objects.
- A clean OU structure supports easier administration.
- Computer objects should be moved into purpose-built OUs instead of leaving everything in default containers.

---

<p align="center">
  <a href="../05-join-windows-11-client-to-domain/README.md">Previous Lab</a> | <a href="../../README.md">Main README</a> | <a href="../07-active-directory-user-management/README.md">Next Lab</a> | <a href="#top">Back to Top</a>
</p>
