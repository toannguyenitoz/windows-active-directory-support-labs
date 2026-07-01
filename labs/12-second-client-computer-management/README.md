<a id="top"></a>

# Lab 12 — Second Client and Computer Management

<p align="center">
  <img src="https://img.shields.io/badge/Windows%2011-Second%20Client-0078D4?logo=windows&logoColor=white" alt="Windows 11">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-green" alt="IT Support">
  <img src="https://img.shields.io/badge/Level-Intermediate-orange" alt="Intermediate">
</p>

<p align="center">
  <a href="../11-rsat-remote-administration/README.md">Previous Lab</a> | <a href="../../README.md">Main README</a> | <a href="../13-print-server-and-network-printer/README.md">Next Lab</a>
</p>

---

## Overview

This lab adds a second Windows 11 client to the domain and shows how to organize multiple computer objects in Active Directory.

Adding a second client helps readers practise domain join again and understand how IT Support teams manage more than one workstation.

---

## Objectives

- Prepare a second Windows 11 client.
- Rename the second client using the naming standard.
- Configure DNS for domain communication.
- Join the second client to the domain.
- Move the second computer object into the correct OU.
- Confirm both clients appear in Active Directory.

---

## Lab Values Used in This Guide

| Item | Value |
|---|---|
| First client | `W11-CLIENT01` |
| Second client | `W11-CLIENT02` |
| Domain | `corp.local` |
| DNS server | `192.168.20.10` |
| Computer OU | `Company > Computers` |

---

## Before You Start

The domain controller must be working and the first Windows 11 client should already be joined to the domain.

---

## Step 1 — Check the Second Client

Start the second Windows 11 client and sign in with a local administrator account.

Open:

```text
Settings > System > About
```

Review the current computer name and Windows edition.

---

## Step 2 — Rename the Second Client

Rename the computer to:

```text
W11-CLIENT02
```

Restart the client when prompted.

After restart, confirm the name:

```cmd
hostname
```

---

## Step 3 — Configure DNS

Open the active network adapter settings and set the DNS server to the domain controller IP:

```text
192.168.20.10
```

Then confirm from Command Prompt:

```cmd
ipconfig /all
```

---

## Step 4 — Test Connectivity

Run:

```cmd
ping 192.168.20.10
nslookup corp.local
```

The client should be able to reach the server and resolve the domain name.

---

## Step 5 — Join the Domain

Open:

```text
System Properties > Computer Name > Change
```

Join the domain:

```text
corp.local
```

Restart the computer when prompted.

---

## Step 6 — Sign In with a Domain Account

After restart, sign in using a domain account.

Example:

```text
CORP\j.smith
```

Confirm that sign-in works.

---

## Step 7 — Move the Computer Object

On the server, open Active Directory Users and Computers.

Find:

```text
W11-CLIENT02
```

Move it into:

```text
Company > Computers
```

---

## Step 8 — Review Both Client Computers

Confirm that both clients appear in the Computers OU:

```text
W11-CLIENT01
W11-CLIENT02
```

This confirms that multiple workstations are now represented in the domain.

---

## Completion Checklist

- [ ] Second client checked.
- [ ] Second client renamed to `W11-CLIENT02`.
- [ ] DNS configured for the second client.
- [ ] Connectivity to server tested.
- [ ] Domain lookup tested.
- [ ] Second client joined to domain.
- [ ] Domain sign-in tested.
- [ ] Computer object moved to the Computers OU.
- [ ] Both clients confirmed in Active Directory.

---

## Key Takeaways

- Each workstation should have a clear and consistent name.
- DNS must be correct before domain join.
- Computer objects should be organized into the correct OU after joining the domain.

---

<p align="center">
  <a href="../11-rsat-remote-administration/README.md">Previous Lab</a> | <a href="../../README.md">Main README</a> | <a href="../13-print-server-and-network-printer/README.md">Next Lab</a> | <a href="#top">Back to Top</a>
</p>
