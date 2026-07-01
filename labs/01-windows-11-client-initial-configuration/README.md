<a id="top"></a>

# 🪟 Lab 01 — Windows 11 Client Initial Configuration

<p align="center">
  <img src="https://img.shields.io/badge/Windows%2011-Client-0078D4?logo=windows&logoColor=white" alt="Windows 11 Client Initial Configuration">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-2E7D32" alt="Guide">
  <img src="https://img.shields.io/badge/Level-Beginner-1565C0" alt="Beginner">
</p>

<p align="center"><a href="../../README.md">🏠 Main README</a> · <a href="../02-windows-server-initial-configuration/README.md">Next Lab ➜</a></p>

---

## 🎯 Lab Mission

Prepare a Windows 11 client computer for a workplace-style IT support environment before DNS, domain join, Active Directory and troubleshooting labs.

> [!NOTE]
> This lab is written as a user guide. Follow the steps in order and compare your result with the expected checks.

## ✅ What You Will Learn

- Check Windows 11 device and edition information.
- Rename a workstation using a clear support naming standard.
- Verify hostname, signed-in account and network configuration.
- Review sleep and Remote Desktop settings for later support tasks.

## 🧱 Lab Values

| Item | Value |
|---|---|
| Client computer name | `W11-CLIENT01` |
| Operating system | Windows 11 Pro, Enterprise or Education recommended |
| Starting state | Local account / workgroup computer |
| Later use | DNS configuration, domain join, remote support and troubleshooting |

## 🧩 Before You Start

- Sign in with a local administrator account.
- Use a safe lab environment with no real business data.
- Keep the client powered on during configuration.
- Record device names and IP values because later labs depend on them.

> [!WARNING]
> Use a lab environment only. Do not publish real passwords, personal information, client data or internal business details.

## 🚀 Step-by-Step Guide

### 🪟 Step 1 — Check Windows 11 device information

Open **Settings > System > About** and review device name, processor, RAM, system type, Windows edition and Windows version.

> [!TIP]
> This creates a baseline before any configuration changes are made.

### 🏷️ Step 2 — Rename the Windows 11 client

Select **Rename this PC**, set the computer name to `W11-CLIENT01`, then restart when prompted.

> [!TIP]
> A clear device name helps with support, inventory, DNS lookup and remote access.

### 💻 Step 3 — Confirm the computer name

After restart, open Command Prompt and confirm the hostname.

Run:

```cmd
hostname
```

> [!TIP]
> Expected result: `W11-CLIENT01`.

### 👤 Step 4 — Confirm the current signed-in account

Check which account is currently signed in before domain join.

Run:

```cmd
whoami
```

> [!TIP]
> Before domain join, the result normally shows a local account.

### 🌐 Step 5 — Review network configuration

Review host name, IPv4 address, subnet mask, gateway, DNS servers and DHCP status.

Run:

```cmd
ipconfig /all
```

> [!TIP]
> Do not change DNS in this lab; DNS is configured later.

### 🔋 Step 6 — Adjust sleep settings

Open **Settings > System > Power & battery > Screen and sleep** and set plugged-in sleep to **Never** or a long value.

> [!TIP]
> This prevents interruptions during later lab tasks.

### 🛰️ Step 7 — Review Remote Desktop settings

Open **Settings > System > Remote Desktop** and review whether Remote Desktop is available.

> [!TIP]
> Windows Home may not support Remote Desktop host functionality.

### 🧪 Step 8 — Run final verification

Run a final baseline check before continuing.

Run:

```cmd
hostname
```

```cmd
whoami
```

```cmd
ipconfig /all
```

```cmd
winver
```

> [!TIP]
> Confirm name, account, network and Windows version.

---

## 🧾 Command Reference

| Command | Run on | Purpose | Expected result |
|---|---|---|---|
| `hostname` | Windows 11 client | Confirms the device name | Shows `W11-CLIENT01` |
| `whoami` | Windows 11 client | Shows the signed-in account | Shows local account before domain join |
| `ipconfig /all` | Windows 11 client | Displays detailed network configuration | Shows IP, DNS, DHCP and adapter information |
| `winver` | Windows 11 client | Shows Windows version | Windows version dialog opens |

---

## ✅ Completion Checklist

- [ ] Windows About page reviewed.
- [ ] Computer renamed to `W11-CLIENT01`.
- [ ] Computer restarted successfully.
- [ ] Hostname output confirmed.
- [ ] Current local account checked.
- [ ] IP and DNS settings reviewed.
- [ ] Sleep settings adjusted or reviewed.
- [ ] Remote Desktop availability reviewed.
- [ ] Final verification commands completed.

---

## 🧠 Key Takeaways

| Key point | Why it matters |
|---|---|
| 1 | Clear computer names simplify support and inventory. |
| 2 | `hostname`, `whoami` and `ipconfig /all` are core support commands. |
| 3 | Stable power settings reduce interruptions during longer lab activities. |

---

## 👤 Author

**Xuan Toan Nguyen**  
IT Support | Service Desk | Desktop Support | System Administration  
Adelaide, South Australia

- 🔗 LinkedIn: [www.linkedin.com/in/toan-nguyen-it-oz](https://www.linkedin.com/in/toan-nguyen-it-oz)
- 💻 GitHub: [github.com/toannguyenitoz](https://github.com/toannguyenitoz)

---

<p align="center"><a href="../../README.md">🏠 Main README</a> · <a href="../02-windows-server-initial-configuration/README.md">Next Lab ➜</a> · <a href="#top">⬆ Back to Top</a></p>