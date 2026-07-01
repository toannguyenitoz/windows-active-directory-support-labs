<a id="top"></a>

# Lab 15 — Network Troubleshooting: Wi-Fi and IP

<p align="center">
  <img src="https://img.shields.io/badge/Networking-Troubleshooting-blue" alt="Networking">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-green" alt="IT Support">
  <img src="https://img.shields.io/badge/Level-Beginner-blue" alt="Beginner">
</p>

<p align="center">
  <a href="../14-remote-desktop-support/README.md">Previous Lab</a> | <a href="../../README.md">Main README</a> | <a href="../16-service-desk-documentation/README.md">Next Lab</a>
</p>

---

## Overview

This lab explains a practical first-level network troubleshooting workflow for Windows clients.

The goal is to help readers identify whether a connection issue is caused by Wi-Fi or Ethernet status, IP configuration, gateway reachability, DNS settings or server connectivity.

---

## Objectives

- Check network connection status.
- Review IP configuration.
- Test gateway or server connectivity.
- Test DNS name resolution.
- Run basic repair commands.
- Document the troubleshooting result.

---

## Common Scenario

A user reports:

```text
I cannot access shared folders or domain resources from my Windows computer.
```

The reader will use structured checks to narrow down the cause.

---

## Step 1 — Confirm Connection Type

Check whether the device is using:

```text
Wi-Fi
Ethernet
Docking station network adapter
```

Open:

```text
Settings > Network & internet
```

Confirm that the active connection shows as connected.

---

## Step 2 — Check IP Configuration

Open Command Prompt and run:

```cmd
ipconfig
```

Review:

```text
IPv4 Address
Subnet Mask
Default Gateway
```

A missing or unusual IP address may indicate a DHCP or adapter issue.

---

## Step 3 — Check Detailed Network Information

Run:

```cmd
ipconfig /all
```

Review:

```text
Adapter name
DHCP Enabled
DNS Servers
Lease information
Physical address
```

This helps identify whether the device has the expected DNS and adapter configuration.

---

## Step 4 — Test the Server or Gateway

Test the lab server:

```cmd
ping 192.168.20.10
```

A successful reply means the client can reach the server IP.

If the ping fails, check:

- Network cable or Wi-Fi connection.
- IP address range.
- Subnet mask.
- Firewall or network isolation.
- Wrong adapter selected.

---

## Step 5 — Test Domain Name Resolution

Run:

```cmd
nslookup corp.local
```

The result should come from the domain DNS server.

If the command fails, review the DNS server value in `ipconfig /all`.

---

## Step 6 — Test Computer Name Resolution

Run:

```cmd
ping SRV-DC01
```

This checks whether the client can resolve the server name.

If IP ping works but name ping fails, the issue is likely related to DNS or name resolution.

---

## Step 7 — Refresh IP and DNS Information

Use these commands when appropriate:

```cmd
ipconfig /flushdns
ipconfig /release
ipconfig /renew
```

Then check the new configuration:

```cmd
ipconfig /all
```

Only use release and renew when the client uses DHCP.

---

## Step 8 — Record the Troubleshooting Result

Write down:

```text
What the user reported
Connection type
IP address
DNS server
Tests completed
Result of each test
Likely cause
Next action
```

Clear documentation helps if the issue needs to be escalated.

---

## Completion Checklist

- [ ] Connection type checked.
- [ ] Network status reviewed.
- [ ] `ipconfig` checked.
- [ ] `ipconfig /all` checked.
- [ ] Server or gateway ping tested.
- [ ] DNS lookup tested.
- [ ] Name resolution tested.
- [ ] Repair commands used where appropriate.
- [ ] Troubleshooting result documented.

---

## Key Takeaways

- Start with simple checks before changing settings.
- IP connectivity and DNS name resolution are different tests.
- `ipconfig /all`, `ping` and `nslookup` are core IT Support troubleshooting commands.
- Good notes make escalation easier.

---

<p align="center">
  <a href="../14-remote-desktop-support/README.md">Previous Lab</a> | <a href="../../README.md">Main README</a> | <a href="../16-service-desk-documentation/README.md">Next Lab</a> | <a href="#top">Back to Top</a>
</p>
