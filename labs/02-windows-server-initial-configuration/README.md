<a id="top"></a>

# Lab 02 — Windows Server Initial Configuration

<p align="center">
  <img src="https://img.shields.io/badge/Windows%20Server-Admin-5E5E5E?logo=windows&logoColor=white" alt="Windows Server">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-green" alt="IT Support">
  <img src="https://img.shields.io/badge/Level-Beginner-blue" alt="Beginner">
</p>

<p align="center">
  <a href="../01-windows-11-client-initial-configuration/README.md">Previous Lab</a> | <a href="../../README.md">Main README</a> | <a href="../03-network-and-dns-configuration/README.md">Next Lab</a>
</p>

---

## Overview

This lab prepares a Windows Server computer for later network, DNS and directory service configuration.

The purpose is to confirm the server baseline, apply a clear server name, check the network adapter, review remote management settings and make sure the server is stable before any roles are added.

---

## Objectives

- Open Server Manager and review the Local Server page.
- Rename the server using a clear naming standard.
- Confirm the server name after restart.
- Review current IP and DNS settings.
- Review Remote Desktop and firewall status.
- Run final verification commands.

---

## Lab Values Used in This Guide

| Item | Value |
|---|---|
| Server name | `SRV-DC01` |
| Server role later | Domain controller, DNS, file and print support |
| Starting state | Standalone Windows Server |
| Later domain | `corp.local` |

---

## Before You Start

Make sure you can sign in to Windows Server with a local administrator account.

Recommended preparation:

- Keep the server powered on during the lab.
- Record the server name and IP address you use.
- Do not add Active Directory yet; that is covered in a later lab.

---

## Step 1 — Open Server Manager

After signing in, open **Server Manager**.

Go to:

```text
Server Manager > Local Server
```

Review:

```text
Computer name
Workgroup or domain state
Remote Desktop
Ethernet
Windows Firewall
Time zone
Windows Update
```

This provides the server baseline before configuration changes.

---

## Step 2 — Rename the Server

From **Local Server**, select the current computer name.

Change the server name to:

```text
SRV-DC01
```

Restart the server when prompted.

A clear server name helps identify the server role and makes support documentation easier.

---

## Step 3 — Confirm the Server Name

After restart, open Command Prompt and run:

```cmd
hostname
```

Expected result:

```text
SRV-DC01
```

---

## Step 4 — Review Network Configuration

Run:

```cmd
ipconfig /all
```

Record the following values:

```text
IPv4 Address
Subnet Mask
Default Gateway
DNS Servers
Network adapter name
```

Do not finalize the static IP in this lab. The next lab focuses on IP and DNS configuration.

---

## Step 5 — Review Remote Desktop

In Server Manager, go to **Local Server** and review the Remote Desktop setting.

For later remote administration labs, Remote Desktop can be enabled in a controlled lab environment.

Confirm that only approved lab accounts are used for remote access.

---

## Step 6 — Review Time Zone and Update Status

Still on the Local Server page, review:

```text
Time zone
Windows Update status
```

A correct time zone is important because authentication, logs and troubleshooting depend on accurate time.

---

## Step 7 — Run Final Verification

Run:

```cmd
hostname
ipconfig /all
winver
```

Confirm that:

- The server name is correct.
- The current IP and DNS settings are known.
- Windows Server version is confirmed.
- The server is ready for network and DNS configuration.

---

## Completion Checklist

- [ ] Server Manager opened successfully.
- [ ] Local Server page reviewed.
- [ ] Server renamed to `SRV-DC01`.
- [ ] Server restarted successfully.
- [ ] `hostname` output confirmed.
- [ ] Current IP and DNS settings reviewed.
- [ ] Remote Desktop status reviewed.
- [ ] Time zone and update status reviewed.

---

## Key Takeaways

- Server naming should clearly describe the server purpose.
- Server Manager is the main starting point for Windows Server administration.
- Time, network and remote access settings should be checked before adding server roles.

---

<p align="center">
  <a href="../01-windows-11-client-initial-configuration/README.md">Previous Lab</a> | <a href="../../README.md">Main README</a> | <a href="../03-network-and-dns-configuration/README.md">Next Lab</a> | <a href="#top">Back to Top</a>
</p>
