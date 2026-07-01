<a id="top"></a>

# Lab 04 — Active Directory Domain Services Setup

<p align="center">
  <img src="https://img.shields.io/badge/Active%20Directory-Domain%20Services-6A1B9A" alt="Active Directory">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-green" alt="IT Support">
  <img src="https://img.shields.io/badge/Level-Intermediate-orange" alt="Intermediate">
</p>

<p align="center">
  <a href="../03-network-and-dns-configuration/README.md">Previous Lab</a> | <a href="../../README.md">Main README</a> | <a href="../05-join-windows-11-client-to-domain/README.md">Next Lab</a>
</p>

---

## Overview

This lab turns the Windows Server into the central identity server for the lab environment.

After this lab, the server will provide a lab domain that Windows clients can join. This allows users, groups, computers and policies to be managed from one place.

---

## Objectives

- Add the Active Directory Domain Services role.
- Promote the server to a domain controller.
- Create a new lab forest and domain.
- Confirm the server restarts and signs in correctly.
- Confirm the environment is ready for client domain join.

---

## Lab Values Used in This Guide

| Item | Value |
|---|---|
| Server name | `SRV-DC01` |
| Domain name | `corp.local` |
| Server IP | `192.168.20.10` |
| DNS role | Installed with domain services |
| Next lab use | Join Windows 11 client to domain |

---

## Before You Start

Complete the previous network and DNS lab first.

Confirm these items before installing the role:

```cmd
hostname
ipconfig /all
```

The server should have a stable IP address and should be able to use its own IP as DNS.

---

## Step 1 — Open Add Roles and Features

Open:

```text
Server Manager > Manage > Add Roles and Features
```

Select:

```text
Role-based or feature-based installation
```

Choose the local server.

---

## Step 2 — Select Active Directory Domain Services

In the server roles list, select:

```text
Active Directory Domain Services
```

When Windows asks to add required features and management tools, accept the default selection.

Continue through the wizard and install the role.

---

## Step 3 — Start Domain Controller Configuration

After installation, return to Server Manager.

Open the notification flag and select:

```text
Promote this server to a domain controller
```

This starts the configuration wizard.

---

## Step 4 — Create a New Forest

Select:

```text
Add a new forest
```

Use the lab root domain name:

```text
corp.local
```

This creates the first domain in the lab forest.

---

## Step 5 — Review Configuration Options

Continue through the wizard using lab-safe values.

Review these areas carefully:

```text
Domain controller options
DNS options
NetBIOS name
Paths
Prerequisites check
```

The prerequisite check should pass before installation.

---

## Step 6 — Install and Restart

Start the installation.

The server will restart automatically when the process finishes.

After restart, sign in again and confirm that the domain is available.

---

## Step 7 — Verify Domain Controller Status

Open Command Prompt and run:

```cmd
hostname
ipconfig /all
echo %USERDOMAIN%
```

Confirm:

- The server name is still `SRV-DC01`.
- DNS points to the server.
- The domain value is available after sign-in.

---

## Step 8 — Open Active Directory Tools

Open:

```text
Server Manager > Tools > Active Directory Users and Computers
```

Confirm that the domain is visible.

Also open:

```text
Server Manager > Tools > DNS
```

Confirm that DNS management opens successfully.

---

## Completion Checklist

- [ ] Active Directory Domain Services role installed.
- [ ] Server promoted to domain controller.
- [ ] New forest created using `corp.local`.
- [ ] Server restarted successfully.
- [ ] Domain sign-in confirmed.
- [ ] Active Directory Users and Computers opened.
- [ ] DNS management opened.

---

## Key Takeaways

- Active Directory centralizes user, computer and group management.
- DNS is required for clients to locate domain services.
- The first domain controller creates the foundation for the rest of the lab.

---

<p align="center">
  <a href="../03-network-and-dns-configuration/README.md">Previous Lab</a> | <a href="../../README.md">Main README</a> | <a href="../05-join-windows-11-client-to-domain/README.md">Next Lab</a> | <a href="#top">Back to Top</a>
</p>
