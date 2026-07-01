<a id="top"></a>

# Lab 03 — Network and DNS Configuration

<p align="center">
  <img src="https://img.shields.io/badge/Networking-DNS-blue" alt="Networking">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-green" alt="IT Support">
  <img src="https://img.shields.io/badge/Level-Beginner-blue" alt="Beginner">
</p>

<p align="center">
  <a href="../02-windows-server-initial-configuration/README.md">Previous Lab</a> | <a href="../../README.md">Main README</a> | <a href="../04-active-directory-domain-services-setup/README.md">Next Lab</a>
</p>

---

## Overview

This lab configures the basic network and DNS settings required before Active Directory can be installed and before a Windows 11 client can join the domain.

The key idea is simple: the Windows 11 client must use the server as its DNS server so it can locate the domain controller in later labs.

---

## Objectives

- Configure or confirm the server IP address.
- Configure the server DNS setting.
- Configure the Windows 11 client DNS setting.
- Test connectivity between client and server.
- Confirm the environment is ready for directory service setup.

---

## Lab Values Used in This Guide

| Item | Value |
|---|---|
| Server name | `SRV-DC01` |
| Server IP | `192.168.20.10` |
| Client name | `W11-CLIENT01` |
| Client IP | `192.168.20.101` |
| Subnet mask | `255.255.255.0` |
| Client DNS server | `192.168.20.10` |

> Use values that match your own lab, but keep server and client on the same network.

---

## Before You Start

Complete Lab 01 and Lab 02 first.

You should know:

- The server computer name.
- The client computer name.
- The IP range used by the lab.
- Which network adapter is connected.

---

## Step 1 — Review Server Network Adapter

On the server, open:

```text
Control Panel > Network and Internet > Network Connections
```

Open the Ethernet adapter properties and select:

```text
Internet Protocol Version 4 (TCP/IPv4)
```

Review the current IP configuration before making changes.

---

## Step 2 — Configure Server IPv4 Settings

Set the server IPv4 values using your lab design.

Example values:

```text
IP address: 192.168.20.10
Subnet mask: 255.255.255.0
Default gateway: use your lab gateway if required
Preferred DNS server: 192.168.20.10
```

The server uses itself as DNS because it will provide DNS services after the domain role is configured.

---

## Step 3 — Verify Server IP Configuration

On the server, open Command Prompt and run:

```cmd
ipconfig /all
```

Confirm:

- IPv4 address is correct.
- Subnet mask is correct.
- DNS server points to the server IP.
- The correct adapter is being used.

---

## Step 4 — Configure Client DNS Setting

On the Windows 11 client, open the IPv4 properties for the active network adapter.

Set the preferred DNS server to:

```text
192.168.20.10
```

This allows the client to use the server for name resolution in later domain labs.

---

## Step 5 — Verify Client IP Configuration

On the Windows 11 client, run:

```cmd
ipconfig /all
```

Confirm:

- The client has a valid IPv4 address.
- The client is on the same network as the server.
- The DNS server value points to the server IP.

---

## Step 6 — Test Client to Server Connectivity

From the Windows 11 client, run:

```cmd
ping 192.168.20.10
```

A successful reply confirms that the client can reach the server.

A failed test usually means one of these areas needs checking:

- Incorrect IP address.
- Wrong subnet mask.
- Wrong network adapter.
- Firewall rule blocking the test.
- Client and server not on the same network.

---

## Step 7 — Record the Final Network Values

Record the final values before moving to the next lab:

```text
Server name
Server IP
Client name
Client IP
Client DNS server
Domain name planned for next lab
```

These values are required for Active Directory setup and domain join.

---

## Completion Checklist

- [ ] Server network adapter reviewed.
- [ ] Server IPv4 settings configured or confirmed.
- [ ] Server DNS value reviewed.
- [ ] Client DNS points to the server IP.
- [ ] Client IP configuration checked.
- [ ] Client can reach the server.
- [ ] Final network values recorded.

---

## Key Takeaways

- DNS is critical for Active Directory.
- Domain clients should use the domain controller DNS service, not a random external DNS server.
- `ipconfig /all` and `ping` are essential support commands for first-level network checks.

---

<p align="center">
  <a href="../02-windows-server-initial-configuration/README.md">Previous Lab</a> | <a href="../../README.md">Main README</a> | <a href="../04-active-directory-domain-services-setup/README.md">Next Lab</a> | <a href="#top">Back to Top</a>
</p>
