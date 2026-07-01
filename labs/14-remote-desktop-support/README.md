<a id="top"></a>

# Lab 14 — Remote Desktop Support

<p align="center">
  <img src="https://img.shields.io/badge/Windows-Remote%20Support-0078D4?logo=windows&logoColor=white" alt="Remote Support">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-green" alt="IT Support">
  <img src="https://img.shields.io/badge/Level-Intermediate-orange" alt="Intermediate">
</p>

<p align="center">
  <a href="../13-print-server-and-network-printer/README.md">Previous Lab</a> | <a href="../../README.md">Main README</a> | <a href="../15-network-troubleshooting-wifi-ip/README.md">Next Lab</a>
</p>

---

## Overview

This lab explains a basic Remote Desktop support workflow.

Remote support allows an approved support person to connect to another computer for troubleshooting or administration. This lab focuses on safe lab practice, connection checks and professional support behaviour.

---

## Objectives

- Review Remote Desktop availability.
- Confirm the target computer name and IP address.
- Test network connectivity to the target computer.
- Open the Remote Desktop client.
- Connect to the target computer.
- Close the session safely after support testing.

---

## Lab Values Used in This Guide

| Item | Value |
|---|---|
| Support computer | `W11-CLIENT01` |
| Target computer | `W11-CLIENT02` or `SRV-DC01` |
| Domain | `corp.local` |
| Tool | Remote Desktop Connection |

---

## Before You Start

Use Remote Desktop only in a safe lab environment or where you have permission.

Confirm that the target computer supports Remote Desktop and is powered on.

---

## Step 1 — Review Remote Desktop Settings on the Target

On the target computer, open:

```text
Settings > System > Remote Desktop
```

Review whether Remote Desktop is enabled.

Windows 11 Pro, Enterprise and Education editions usually support Remote Desktop host functionality. Windows Home editions may not.

---

## Step 2 — Confirm the Target Computer Name

On the target computer, open Command Prompt and run:

```cmd
hostname
```

Record the result.

Example:

```text
W11-CLIENT02
```

---

## Step 3 — Confirm the Target IP Address

On the target computer, run:

```cmd
ipconfig
```

Record the IPv4 address.

This gives an alternative connection method if name resolution is not working.

---

## Step 4 — Test Connectivity from the Support Computer

From the support computer, run:

```cmd
ping W11-CLIENT02
```

If name ping fails, test the IP address:

```cmd
ping 192.168.20.102
```

Successful connectivity confirms that the support computer can reach the target.

---

## Step 5 — Open Remote Desktop Connection

On the support computer, open:

```text
Start > Remote Desktop Connection
```

Or run:

```cmd
mstsc
```

---

## Step 6 — Connect to the Target Computer

Enter the target computer name or IP address.

Example:

```text
W11-CLIENT02
```

Sign in using an approved domain account.

Confirm that the remote session opens successfully.

---

## Step 7 — Complete a Simple Support Check

Inside the remote session, complete a safe check such as:

```text
Open Settings
Check device name
Open Command Prompt
Run hostname
```

This confirms that the remote session is usable.

---

## Step 8 — Close the Remote Session Safely

When testing is complete, close the session properly.

Use one of these methods:

```text
Sign out from the remote computer
Disconnect the Remote Desktop session
```

For real support work, always communicate with the user before connecting, making changes or ending the session.

---

## Completion Checklist

- [ ] Remote Desktop availability reviewed on the target.
- [ ] Target computer name confirmed.
- [ ] Target IP address confirmed.
- [ ] Connectivity tested from support computer.
- [ ] Remote Desktop Connection opened.
- [ ] Remote session established.
- [ ] Basic support check completed.
- [ ] Session closed safely.

---

## Key Takeaways

- Remote Desktop requires the target computer to allow remote connections.
- Computer name and IP address are both useful for connection testing.
- Remote support should always be performed with permission and clear communication.

---

<p align="center">
  <a href="../13-print-server-and-network-printer/README.md">Previous Lab</a> | <a href="../../README.md">Main README</a> | <a href="../15-network-troubleshooting-wifi-ip/README.md">Next Lab</a> | <a href="#top">Back to Top</a>
</p>
