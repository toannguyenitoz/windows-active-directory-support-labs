<a id="top"></a>

# 📁 Lab 10 — Home Folder and File Share

<p align="center">
  <img src="https://img.shields.io/badge/Windows%20Server-File%20Share-5E5E5E?logo=windows&logoColor=white" alt="Home Folder and File Share">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-2E7D32" alt="Guide">
  <img src="https://img.shields.io/badge/Level-Intermediate-F9A825" alt="Intermediate">
</p>

<p align="center"><a href="../09-password-lockout-logon-controls/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../11-rsat-remote-administration/README.md">Next Lab ➜</a></p>

---

## 🎯 Lab Mission

Create a basic server file share and test access from a domain user.

> [!NOTE]
> This lab is written as a user guide. Follow the steps in order and compare your result with the expected checks.

## ✅ What You Will Learn

- Create a shared folder.
- Review share and NTFS permissions.
- Test access from a Windows 11 client.
- Confirm the real user experience.

## 🧱 Lab Values

| Item | Value |
|---|---|
| Server | `SRV-DC01` |
| Share folder | `C:\Shares\SharedData` |
| Share name | `SharedData` |
| Test user | `j.smith` |

## 🧩 Before You Start

- Confirm domain sign-in works.
- Confirm groups are created.

> [!WARNING]
> Use a lab environment only. Do not publish real passwords, personal information, client data or internal business details.

## 🚀 Step-by-Step Guide

### 📂 Step 1 — Create server folder

Create `C:\Shares\SharedData`.

> [!TIP]
> Use clear folder names for support clarity.

### 🧰 Step 2 — Open folder properties

Review Sharing and Security tabs.

> [!TIP]
> Sharing and NTFS permissions both matter.

### 🌐 Step 3 — Share the folder

Share as `SharedData`.

> [!TIP]
> Network path becomes `\\SRV-DC01\SharedData`.

### 👥 Step 4 — Review share permissions

Grant access to an appropriate group such as `GG_StandardUsers`.

> [!TIP]
> Manage access through groups.

### 🔐 Step 5 — Review NTFS permissions

Review Security tab permissions.

> [!TIP]
> The most restrictive effective permission normally wins.

### 💻 Step 6 — Test from client

Open `\\SRV-DC01\SharedData` from the Windows client.

> [!TIP]
> Client testing shows the real user experience.

### 📝 Step 7 — Create a test file

Create `access-test.txt` in the share.

> [!TIP]
> Confirms write access if intended.

### 🔍 Step 8 — Verify from server

Confirm the file appears in the server folder.

> [!TIP]
> Verifies end-to-end file access.

### 🧪 Step 9 — Optional mapped drive check

Run network drive check.

Run:

```cmd
net use
```

> [!TIP]
> Shows current mapped drives and connections.

---

## 🧾 Command Reference

| Command | Run on | Purpose | Expected result |
|---|---|---|---|
| `net use` | Client | Displays mapped drives/connections | Shows current network connections |

---

## ✅ Completion Checklist

- [ ] Server folder created.
- [ ] Folder shared.
- [ ] Share permissions reviewed.
- [ ] NTFS permissions reviewed.
- [ ] Client can open share.
- [ ] Test file created.
- [ ] File confirmed on server.

---

## 🧠 Key Takeaways

| Key point | Why it matters |
|---|---|
| 1 | Use groups for access management. |
| 2 | Share and NTFS permissions both affect access. |
| 3 | Testing from the client confirms real access. |

---

## 👤 Author

**Xuan Toan Nguyen**  
IT Support | Service Desk | Desktop Support | System Administration  
Adelaide, South Australia

- 🔗 LinkedIn: [www.linkedin.com/in/toan-nguyen-it-oz](https://www.linkedin.com/in/toan-nguyen-it-oz)
- 💻 GitHub: [github.com/toannguyenitoz](https://github.com/toannguyenitoz)

---

<p align="center"><a href="../09-password-lockout-logon-controls/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../11-rsat-remote-administration/README.md">Next Lab ➜</a> · <a href="#top">⬆ Back to Top</a></p>