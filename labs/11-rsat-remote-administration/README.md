<a id="top"></a>

# 🛠️ Lab 11 — RSAT Remote Administration

<p align="center">
  <img src="https://img.shields.io/badge/Windows%2011-RSAT-0078D4?logo=windows&logoColor=white" alt="RSAT Remote Administration">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-2E7D32" alt="Guide">
  <img src="https://img.shields.io/badge/Level-Intermediate-F9A825" alt="Intermediate">
</p>

<p align="center"><a href="../10-home-folder-and-file-share/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../12-second-client-computer-management/README.md">Next Lab ➜</a></p>

---

## 🎯 Lab Mission

Use RSAT from a Windows 11 client to manage server and directory tools remotely.

> [!NOTE]
> This lab is written as a user guide. Follow the steps in order and compare your result with the expected checks.

## ✅ What You Will Learn

- Install RSAT tools.
- Open ADUC from the client.
- Browse domain objects.
- Check Active Directory PowerShell availability.

## 🧱 Lab Values

| Item | Value |
|---|---|
| Admin workstation | `W11-CLIENT01` |
| Server | `SRV-DC01` |
| Domain | `corp.local` |

## 🧩 Before You Start

- Client must be joined to domain.
- Use an approved account with suitable permissions.

> [!WARNING]
> Use a lab environment only. Do not publish real passwords, personal information, client data or internal business details.

## 🚀 Step-by-Step Guide

### ⚙️ Step 1 — Open Optional Features

Open Settings > Apps > Optional features and search for RSAT.

> [!TIP]
> Feature names may vary by Windows version.

### ➕ Step 2 — Install AD RSAT tools

Install Active Directory tools.

> [!TIP]
> Wait for installation to complete.

### 🧰 Step 3 — Open Windows Tools

Launch Active Directory Users and Computers from Windows Tools.

> [!TIP]
> This confirms the GUI tool is installed.

### 🌐 Step 4 — Browse the domain

Browse `Company > Users`, `Groups`, `Computers`.

> [!TIP]
> Confirms remote admin view works.

### 👤 Step 5 — Review a user

Open `j.smith` and review tabs.

> [!TIP]
> Do not make unnecessary changes.

### 👥 Step 6 — Review a group

Open `GG_StandardUsers` and review Members tab.

> [!TIP]
> Verify group membership remotely.

### 💻 Step 7 — Run command check

Check AD PowerShell module availability.

Run:

```powershell
Get-Command Get-ADUser
```

```powershell
Get-ADDomain
```

> [!TIP]
> Commands should work if module and permissions are available.

---

## 🧾 Command Reference

| Command | Run on | Purpose | Expected result |
|---|---|---|---|
| `Get-Command Get-ADUser` | Client | Checks AD PowerShell cmdlet availability | Returns cmdlet details |
| `Get-ADDomain` | Client | Displays domain information | Shows `corp.local` details |

---

## ✅ Completion Checklist

- [ ] RSAT searched.
- [ ] AD tools installed.
- [ ] ADUC opened from client.
- [ ] Domain browsed from client.
- [ ] User object reviewed.
- [ ] Group object reviewed.
- [ ] PowerShell availability checked.

---

## 🧠 Key Takeaways

| Key point | Why it matters |
|---|---|
| 1 | RSAT enables remote administration from a workstation. |
| 2 | Remote tools require suitable permissions. |
| 3 | Avoid using the server console for every task. |

---

## 👤 Author

**Xuan Toan Nguyen**  
IT Support | Service Desk | Desktop Support | System Administration  
Adelaide, South Australia

- 🔗 LinkedIn: [www.linkedin.com/in/toan-nguyen-it-oz](https://www.linkedin.com/in/toan-nguyen-it-oz)
- 💻 GitHub: [github.com/toannguyenitoz](https://github.com/toannguyenitoz)

---

<p align="center"><a href="../10-home-folder-and-file-share/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../12-second-client-computer-management/README.md">Next Lab ➜</a> · <a href="#top">⬆ Back to Top</a></p>