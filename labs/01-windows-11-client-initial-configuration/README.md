<a id="top"></a>

# 🪟 Lab 01 — Windows 11 Client Initial Configuration

<p align="center">
  <img src="https://img.shields.io/badge/Windows%2011-Client-0078D4?logo=windows&logoColor=white" alt="Windows 11">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-2E7D32" alt="IT Support">
  <img src="https://img.shields.io/badge/Level-Beginner-1565C0" alt="Beginner">
  <img src="https://img.shields.io/badge/Status-Ready-F9A825" alt="Ready">
</p>

<p align="center">
  <a href="../../README.md">🏠 Main README</a> ·
  <a href="../02-windows-server-initial-configuration/README.md">Next Lab ➜</a>
</p>

---

## 🎯 Lab Mission

Prepare a Windows 11 client computer for a workplace-style IT support environment.

By the end of this lab, the computer will have a clear device name, verified local account information, reviewed network settings, stable power settings and confirmed Remote Desktop availability. This prepares the client for later DNS, domain join, Active Directory and troubleshooting labs.

---

## ✅ What You Will Learn

| Skill | What it means in IT Support |
|---|---|
| 🪟 Check device information | Confirm Windows edition, system type and baseline details |
| 🏷️ Rename a workstation | Apply a clear naming standard for support and inventory |
| 💻 Use support commands | Verify hostname, signed-in user and network configuration |
| 🌐 Review IP and DNS | Understand the client network state before domain join |
| 🔋 Adjust power settings | Prevent lab interruptions during configuration |
| 🛰️ Review Remote Desktop | Prepare for later remote support scenarios |

---

## 🧱 Lab Values Used in This Guide

| Item | Value |
|---|---|
| 🖥️ Client computer name | `W11-CLIENT01` |
| 🪟 Operating system | Windows 11 Pro, Enterprise or Education recommended |
| 👤 Starting state | Local account / workgroup computer |
| 🔜 Later use | DNS configuration, domain join, remote support and troubleshooting |

> Readers can use different names in their own environment, but should keep a consistent naming standard across all labs.

---

## 🧩 Before You Start

Make sure the Windows 11 client can start normally and that you can sign in with a local administrator account.

Recommended preparation:

- ✅ Use a safe lab environment.
- ✅ Do not use real business data.
- ✅ Keep the client powered on during configuration.
- ✅ Record any names or IP addresses you use because later labs depend on them.

---

## 🪟 Step 1 — Check Windows 11 Device Information

Open:

```text
Settings > System > About
```

Review the following information:

```text
Device name
Processor
Installed RAM
System type
Windows edition
Windows version
```

💡 **Why this matters:** This gives a baseline view of the client before any configuration changes are made.

---

## 🏷️ Step 2 — Rename the Windows 11 Client

From the About page, select:

```text
Rename this PC
```

Set the computer name to:

```text
W11-CLIENT01
```

Restart the computer when Windows asks for a restart.

💡 **Why this matters:** A clear device name helps with support, inventory, DNS lookup, remote access and Active Directory administration.

---

## 💻 Step 3 — Confirm the Computer Name

After the restart, open Command Prompt and run:

```cmd
hostname
```

Expected result:

```text
W11-CLIENT01
```

✅ **Success check:** The hostname output matches the workstation name used in this guide.

---

## 👤 Step 4 — Confirm the Current Signed-In Account

Run:

```cmd
whoami
```

Before the client joins a domain, the result normally shows a local account, for example:

```text
w11-client01\localuser
```

💡 **Why this matters:** This helps support staff confirm whether the user is signed in with a local account or a domain account.

---

## 🌐 Step 5 — Review Network Configuration

Run:

```cmd
ipconfig /all
```

Check the following values:

```text
Host Name
IPv4 Address
Subnet Mask
Default Gateway
DNS Servers
DHCP Enabled
```

> **Important:** Do not change DNS in this lab. DNS will be configured later so the client can find the domain controller.

---

## 🔋 Step 6 — Adjust Sleep Settings

Open:

```text
Settings > System > Power & battery > Screen and sleep
```

Recommended setting while plugged in:

```text
Put my device to sleep after: Never
```

💡 **Why this matters:** This prevents the client from sleeping during network testing, domain join, remote access and troubleshooting activities.

---

## 🛰️ Step 7 — Review Remote Desktop Settings

Open:

```text
Settings > System > Remote Desktop
```

Review whether Remote Desktop is available.

| Windows edition | Remote Desktop host support |
|---|---|
| Windows 11 Pro | Usually supported |
| Windows 11 Enterprise | Usually supported |
| Windows 11 Education | Usually supported |
| Windows 11 Home | Usually not supported as a host |

This setting is reviewed now because later labs include remote support practice.

---

## 🧪 Step 8 — Run Final Verification

Open Command Prompt and run:

```cmd
hostname
whoami
ipconfig /all
winver
```

Use the results to confirm:

- ✅ The computer name is correct.
- ✅ The current account is known.
- ✅ Network settings are visible.
- ✅ The Windows version is confirmed.

---

## ✅ Completion Checklist

- [ ] Windows About page reviewed.
- [ ] Computer renamed to `W11-CLIENT01`.
- [ ] Computer restarted successfully.
- [ ] `hostname` output confirmed.
- [ ] Current local account checked.
- [ ] IP and DNS settings reviewed.
- [ ] Sleep settings adjusted or reviewed.
- [ ] Remote Desktop availability reviewed.
- [ ] Final verification commands completed.

---

## 🧠 Key Takeaways

| Key point | Why it matters |
|---|---|
| 🏷️ Clear computer names | Makes support, inventory and remote access easier |
| 💻 Basic commands | `hostname`, `whoami` and `ipconfig /all` are essential support tools |
| 🌐 DNS readiness | A client needs correct DNS before joining a domain |
| 🔋 Power settings | Stable power settings prevent interruptions during labs |

---

## 👤 Author

**Xuan Toan Nguyen**  
IT Support | Service Desk | Desktop Support | System Administration  
Adelaide, South Australia

- 🔗 LinkedIn: [www.linkedin.com/in/toan-nguyen-it-oz](https://www.linkedin.com/in/toan-nguyen-it-oz)
- 💻 GitHub: [github.com/toannguyenitoz](https://github.com/toannguyenitoz)

---

<p align="center">
  <a href="../../README.md">🏠 Main README</a> ·
  <a href="../02-windows-server-initial-configuration/README.md">Next Lab ➜</a> ·
  <a href="#top">⬆ Back to Top</a>
</p>
