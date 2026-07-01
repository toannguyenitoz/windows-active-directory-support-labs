<a id="top"></a>

# Lab 05 — Join Windows 11 Client to Domain

<p align="center">
  <img src="https://img.shields.io/badge/Windows%2011-Domain%20Join-0078D4?logo=windows&logoColor=white" alt="Windows 11">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-green" alt="IT Support">
  <img src="https://img.shields.io/badge/Level-Intermediate-orange" alt="Intermediate">
</p>

<p align="center">
  <a href="../04-active-directory-domain-services-setup/README.md">Previous Lab</a> | <a href="../../README.md">Main README</a> | <a href="../06-active-directory-ou-structure/README.md">Next Lab</a>
</p>

---

## Overview

This lab joins the Windows 11 client to the Active Directory domain created in the previous lab.

After the domain join, the client can be managed as a domain computer and users can sign in with domain accounts.

---

## Objectives

- Confirm the client DNS setting points to the domain controller.
- Join the Windows 11 client to the domain.
- Restart the client after the join.
- Sign in using a domain account.
- Confirm the computer object appears in Active Directory.

---

## Lab Values Used in This Guide

| Item | Value |
|---|---|
| Client computer name | `W11-CLIENT01` |
| Domain name | `corp.local` |
| Domain controller | `SRV-DC01` |
| DNS server | `192.168.20.10` |

---

## Before You Start

Complete Lab 04 first.

On the Windows 11 client, confirm DNS:

```cmd
ipconfig /all
```

The DNS server should point to the domain controller IP address.

---

## Step 1 — Test Connectivity to the Server

From the Windows 11 client, run:

```cmd
ping 192.168.20.10
```

A successful reply confirms that the client can communicate with the server.

---

## Step 2 — Test Name Resolution

Run:

```cmd
nslookup corp.local
```

The response should come from the domain controller DNS service.

If this fails, review the client DNS setting before continuing.

---

## Step 3 — Open Domain Join Settings

Open:

```text
Settings > System > About > Advanced system settings
```

Then open:

```text
Computer Name > Change
```

This is where the workgroup or domain membership is changed.

---

## Step 4 — Join the Domain

Select:

```text
Domain
```

Enter:

```text
corp.local
```

When prompted, enter a domain account with permission to join computers to the domain.

Windows should display a welcome message after the join succeeds.

---

## Step 5 — Restart the Client

Restart the Windows 11 client when prompted.

The restart is required before the domain membership is fully applied.

---

## Step 6 — Sign In with a Domain Account

At the sign-in screen, choose another user and sign in using a domain account.

Example format:

```text
CORP\username
```

or:

```text
username@corp.local
```

---

## Step 7 — Confirm Domain Membership

After sign-in, open Command Prompt and run:

```cmd
hostname
whoami
echo %USERDOMAIN%
```

Confirm that the user domain and device state match the lab domain.

---

## Step 8 — Confirm the Computer Object in Active Directory

On the server, open:

```text
Server Manager > Tools > Active Directory Users and Computers
```

Find the computer object for:

```text
W11-CLIENT01
```

This confirms that the client is now known by Active Directory.

---

## Completion Checklist

- [ ] Client DNS points to the domain controller.
- [ ] Client can reach the server IP.
- [ ] Domain name lookup works.
- [ ] Client joined to `corp.local`.
- [ ] Client restarted successfully.
- [ ] Domain sign-in tested.
- [ ] Computer object found in Active Directory.

---

## Key Takeaways

- Domain join depends on correct DNS.
- After joining the domain, the client becomes a managed domain computer.
- Domain users can sign in to the client after restart.

---

<p align="center">
  <a href="../04-active-directory-domain-services-setup/README.md">Previous Lab</a> | <a href="../../README.md">Main README</a> | <a href="../06-active-directory-ou-structure/README.md">Next Lab</a> | <a href="#top">Back to Top</a>
</p>
