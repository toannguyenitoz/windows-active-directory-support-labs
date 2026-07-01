<a id="top"></a>

# 🏢 Lab 04 — Active Directory Domain Services Setup

<p align="center">
  <img src="https://img.shields.io/badge/Active%20Directory-Domain%20Services-6A1B9A" alt="Active Directory Domain Services Setup">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-2E7D32" alt="Guide">
  <img src="https://img.shields.io/badge/Level-Intermediate-F9A825" alt="Intermediate">
</p>

<p align="center"><a href="../03-network-and-dns-configuration/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../05-join-windows-11-client-to-domain/README.md">Next Lab ➜</a></p>

---

## 🎯 Lab Mission

Turn the Windows Server into the central identity server for the lab environment.

> [!NOTE]
> This lab is written as a user guide. Follow the steps in order and compare your result with the expected checks.

## ✅ What You Will Learn

- Install the Active Directory Domain Services role.
- Promote the server to a domain controller.
- Create a new forest and domain.
- Confirm AD and DNS tools open successfully.

## 🧱 Lab Values

| Item | Value |
|---|---|
| Server name | `SRV-DC01` |
| Domain name | `corp.local` |
| Server IP | `192.168.20.10` |
| Next lab use | Join Windows 11 client to domain |

## 🧩 Before You Start

- Complete Lab 03 first.
- Confirm server hostname and IP configuration.
- Use a lab-safe domain name such as `corp.local`.

> [!WARNING]
> Use a lab environment only. Do not publish real passwords, personal information, client data or internal business details.

## 🚀 Step-by-Step Guide

### 🛠️ Step 1 — Open Add Roles and Features

Open **Server Manager > Manage > Add Roles and Features** and choose role-based installation.

> [!TIP]
> Use the local server as the installation target.

### 🏢 Step 2 — Select Active Directory Domain Services

Select **Active Directory Domain Services** and accept required tools.

> [!TIP]
> Management tools are needed for later administration tasks.

### 🚩 Step 3 — Start domain controller configuration

Use the Server Manager notification flag and choose **Promote this server to a domain controller**.

> [!TIP]
> Installing the role alone does not make the server a domain controller.

### 🌲 Step 4 — Create a new forest

Select **Add a new forest** and enter `corp.local`.

> [!TIP]
> This creates the first domain in the lab forest.

### ⚙️ Step 5 — Review configuration options

Review domain controller options, DNS options, NetBIOS name, paths and prerequisites.

> [!TIP]
> The prerequisite check should pass before installation.

### 🔁 Step 6 — Install and restart

Start installation and allow the server to restart automatically.

> [!TIP]
> The restart completes the promotion process.

### 🧪 Step 7 — Verify domain controller status

Confirm hostname, DNS and user domain.

Run:

```cmd
hostname
```

```cmd
ipconfig /all
```

```cmd
echo %USERDOMAIN%
```

> [!TIP]
> The domain should be available after sign-in.

### 🧰 Step 8 — Open Active Directory tools

Open ADUC and DNS from Server Manager tools.

> [!TIP]
> Both consoles should open without errors.

---

## 🧾 Command Reference

| Command | Run on | Purpose | Expected result |
|---|---|---|---|
| `hostname` | Domain controller | Confirms server name | Shows `SRV-DC01` |
| `ipconfig /all` | Domain controller | Confirms DNS/IP settings | DNS points to the server |
| `echo %USERDOMAIN%` | Domain controller | Shows logon domain | Shows the domain value after promotion |

---

## ✅ Completion Checklist

- [ ] AD DS role installed.
- [ ] Server promoted to domain controller.
- [ ] New forest created using `corp.local`.
- [ ] Server restarted successfully.
- [ ] Domain sign-in confirmed.
- [ ] Active Directory Users and Computers opened.
- [ ] DNS management opened.

---

## 🧠 Key Takeaways

| Key point | Why it matters |
|---|---|
| 1 | Active Directory centralizes user, computer and group management. |
| 2 | DNS is required for clients to locate domain services. |
| 3 | The first domain controller is the foundation for the rest of the lab. |

---

## 👤 Author

**Xuan Toan Nguyen**  
IT Support | Service Desk | Desktop Support | System Administration  
Adelaide, South Australia

- 🔗 LinkedIn: [www.linkedin.com/in/toan-nguyen-it-oz](https://www.linkedin.com/in/toan-nguyen-it-oz)
- 💻 GitHub: [github.com/toannguyenitoz](https://github.com/toannguyenitoz)

---

<p align="center"><a href="../03-network-and-dns-configuration/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../05-join-windows-11-client-to-domain/README.md">Next Lab ➜</a> · <a href="#top">⬆ Back to Top</a></p>