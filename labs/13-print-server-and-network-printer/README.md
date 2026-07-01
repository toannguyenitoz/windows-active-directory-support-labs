<a id="top"></a>

# Lab 13 — Print Server and Network Printer

<p align="center">
  <img src="https://img.shields.io/badge/Windows%20Server-Print%20Support-5E5E5E?logo=windows&logoColor=white" alt="Print Server">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-green" alt="IT Support">
  <img src="https://img.shields.io/badge/Level-Intermediate-orange" alt="Intermediate">
</p>

<p align="center">
  <a href="../12-second-client-computer-management/README.md">Previous Lab</a> | <a href="../../README.md">Main README</a> | <a href="../14-remote-desktop-support/README.md">Next Lab</a>
</p>

---

## Overview

This lab explains a basic print support workflow in a Windows Server environment.

Printer issues are common in IT Support. This guide shows how to add print services, create a shared printer for lab practice, connect from a Windows 11 client and review the print queue.

---

## Objectives

- Add print management capability on the server.
- Create or add a lab printer.
- Share the printer with a clear name.
- Connect to the printer from Windows 11.
- Review common print queue actions.
- Understand basic printer troubleshooting checks.

---

## Lab Values Used in This Guide

| Item | Value |
|---|---|
| Server | `SRV-DC01` |
| Client | `W11-CLIENT01` |
| Example printer name | `PRN-LAB-01` |
| Example shared printer name | `Shared-Printer-01` |

---

## Before You Start

The Windows 11 client should be joined to the domain and able to reach the server.

Confirm connectivity from the client:

```cmd
ping 192.168.20.10
```

---

## Step 1 — Open Server Manager

On the server, open:

```text
Server Manager
```

Go to:

```text
Manage > Add Roles and Features
```

Use the wizard to add print management capability for the lab.

---

## Step 2 — Open Print Management

After installation, open:

```text
Server Manager > Tools > Print Management
```

Review the print servers list and confirm the local server appears.

---

## Step 3 — Add a Lab Printer

In Print Management, add a printer for lab practice.

Use a test printer or a safe lab printer configuration.

Give the printer a clear name, for example:

```text
PRN-LAB-01
```

---

## Step 4 — Share the Printer

Open printer properties and review the Sharing tab.

Share the printer using a clear share name:

```text
Shared-Printer-01
```

A clear name makes it easier for users and support staff to identify the correct printer.

---

## Step 5 — Connect from Windows 11 Client

On the Windows 11 client, open:

```text
Settings > Bluetooth and devices > Printers and scanners
```

Add the shared printer from the server.

Confirm that the printer appears in the client printer list.

---

## Step 6 — Review the Print Queue

Open the printer queue from the client or server.

Review common queue actions:

```text
Pause printing
Resume printing
Cancel a stuck job
Open printer properties
Set as default printer
```

This gives the reader a basic printer support workflow.

---

## Step 7 — Basic Troubleshooting Checks

When a user reports a printer issue, check:

- Is the printer visible on the client?
- Is the user connected to the correct printer?
- Is the queue paused?
- Are there stuck jobs?
- Can the client reach the print server?
- Is the printer shared with the expected name?

Useful command:

```cmd
ping 192.168.20.10
```

---

## Completion Checklist

- [ ] Print management opened on the server.
- [ ] Lab printer added or reviewed.
- [ ] Printer shared with a clear name.
- [ ] Windows 11 client connected to the shared printer.
- [ ] Print queue opened.
- [ ] Common queue actions reviewed.
- [ ] Basic troubleshooting checks reviewed.

---

## Key Takeaways

- Printer names should be clear and easy to identify.
- The print queue is an important troubleshooting location.
- Many printer issues are caused by queue state, wrong printer selection or connection problems.

---

<p align="center">
  <a href="../12-second-client-computer-management/README.md">Previous Lab</a> | <a href="../../README.md">Main README</a> | <a href="../14-remote-desktop-support/README.md">Next Lab</a> | <a href="#top">Back to Top</a>
</p>
