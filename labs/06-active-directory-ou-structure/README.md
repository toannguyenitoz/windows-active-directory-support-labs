<a id="top"></a>

# 🗂️ Lab 06 — Active Directory OU Structure

<p align="center">
  <img src="https://img.shields.io/badge/Active%20Directory-OU%20Design-6A1B9A" alt="Active Directory OU Structure">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-2E7D32" alt="Guide">
  <img src="https://img.shields.io/badge/Level-Intermediate-F9A825" alt="Intermediate">
</p>

<p align="center"><a href="../05-join-windows-11-client-to-domain/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../07-active-directory-user-management/README.md">Next Lab ➜</a></p>

---

## 🎯 Lab Mission

Create a clean Organizational Unit structure for users, computers, groups and service accounts.

> [!NOTE]
> This lab is written as a user guide. Follow the steps in order and compare your result with the expected checks.

## ✅ What You Will Learn

- Create top-level and sub-level OUs.
- Organize users, computers and groups.
- Move workstation objects into the correct OU.

## 🧱 Lab Values

| Item | Value |
|---|---|
| Top OU | `Company` |
| User OU | `Company > Users` |
| Computer OU | `Company > Computers` |

## 🧩 Before You Start

- Complete the domain join lab.
- Confirm the client computer object exists.

> [!WARNING]
> Use a lab environment only. Do not publish real passwords, personal information, client data or internal business details.

## 🚀 Step-by-Step Guide

### 🧰 Step 1 — Open ADUC

Open **Server Manager > Tools > Active Directory Users and Computers**.

> [!TIP]
> ADUC is the main GUI for object management.

### 🏢 Step 2 — Create the top-level OU

Create `Company` under the domain.

> [!TIP]
> This becomes the main container.

### 👤 Step 3 — Create user and computer OUs

Create `Users` and `Computers` inside `Company`.

> [!TIP]
> Separate users and computers for cleaner management.

### 👥 Step 4 — Create additional OUs

Create `Groups`, `Service Accounts` and `Disabled Accounts`.

> [!TIP]
> These OUs help as the lab grows.

### 💻 Step 5 — Move client object

Move `W11-CLIENT01` into `Company > Computers`.

> [!TIP]
> Avoid leaving lab objects in default containers.

### 🧪 Step 6 — Verify structure

Optionally list OUs with PowerShell.

Run:

```powershell
Get-ADOrganizationalUnit -Filter *
```

> [!TIP]
> Confirm all OUs are visible.

---

## 🧾 Command Reference

| Command | Run on | Purpose | Expected result |
|---|---|---|---|
| `Get-ADOrganizationalUnit -Filter *` | Server | Lists OUs | Shows created OUs |

---

## ✅ Completion Checklist

- [ ] Company OU created.
- [ ] Users OU created.
- [ ] Computers OU created.
- [ ] Groups OU created.
- [ ] Service Accounts OU created.
- [ ] Disabled Accounts OU created.
- [ ] Client object moved.

---

## 🧠 Key Takeaways

| Key point | Why it matters |
|---|---|
| 1 | OUs organize directory objects. |
| 2 | Clean structure supports easier administration. |
| 3 | Move objects out of default containers. |

---

## 👤 Author

**Xuan Toan Nguyen**  
IT Support | Service Desk | Desktop Support | System Administration  
Adelaide, South Australia

- 🔗 LinkedIn: [www.linkedin.com/in/toan-nguyen-it-oz](https://www.linkedin.com/in/toan-nguyen-it-oz)
- 💻 GitHub: [github.com/toannguyenitoz](https://github.com/toannguyenitoz)

---

<p align="center"><a href="../05-join-windows-11-client-to-domain/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../07-active-directory-user-management/README.md">Next Lab ➜</a> · <a href="#top">⬆ Back to Top</a></p>