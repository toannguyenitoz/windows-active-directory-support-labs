<a id="top"></a>

# 👤 Lab 07 — Active Directory User Management

<p align="center">
  <img src="https://img.shields.io/badge/Active%20Directory-Users-6A1B9A" alt="Active Directory User Management">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-2E7D32" alt="Guide">
  <img src="https://img.shields.io/badge/Level-Intermediate-F9A825" alt="Intermediate">
</p>

<p align="center"><a href="../06-active-directory-ou-structure/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../08-active-directory-group-management/README.md">Next Lab ➜</a></p>

---

## 🎯 Lab Mission

Create and manage a domain user account in Active Directory.

> [!NOTE]
> This lab is written as a user guide. Follow the steps in order and compare your result with the expected checks.

## ✅ What You Will Learn

- Create a user account.
- Review account properties.
- Test domain sign-in.
- Disable and enable a user account.

## 🧱 Lab Values

| Item | Value |
|---|---|
| Example user | `j.smith` |
| OU | `Company > Users` |
| Department | IT Support |

## 🧩 Before You Start

- Complete the OU structure lab.
- Confirm the Users OU exists.

> [!WARNING]
> Use a lab environment only. Do not publish real passwords, personal information, client data or internal business details.

## 🚀 Step-by-Step Guide

### 🧰 Step 1 — Open the Users OU

Browse to `corp.local > Company > Users`.

> [!TIP]
> Create users in the correct OU.

### ➕ Step 2 — Create a user

Create John Smith with username `j.smith`.

> [!TIP]
> Use lab-safe credentials only.

### 📝 Step 3 — Review properties

Review General, Account, Profile, Member Of and Organization tabs.

> [!TIP]
> Good properties help future support.

### 🔍 Step 4 — Confirm the user exists

Use PowerShell to verify the account.

Run:

```powershell
Get-ADUser j.smith
```

> [!TIP]
> The account should return successfully.

### 👤 Step 5 — Test domain sign-in

Sign in from the client with `CORP\j.smith` or `j.smith@corp.local`.

> [!TIP]
> Client testing confirms usability.

### ⛔ Step 6 — Disable the account

Disable the account and observe sign-in behavior.

> [!TIP]
> This demonstrates access control.

### ✅ Step 7 — Enable the account again

Enable the account and confirm access is restored.

> [!TIP]
> Restore account state after testing.

---

## 🧾 Command Reference

| Command | Run on | Purpose | Expected result |
|---|---|---|---|
| `Get-ADUser j.smith` | Server | Finds the user object | Returns user details |

---

## ✅ Completion Checklist

- [ ] User created.
- [ ] Properties reviewed.
- [ ] Department or description added.
- [ ] Sign-in tested.
- [ ] Disable behavior reviewed.
- [ ] Account enabled again.

---

## 🧠 Key Takeaways

| Key point | Why it matters |
|---|---|
| 1 | Create users in the correct OU. |
| 2 | Clear properties help support staff. |
| 3 | Client testing confirms directory changes. |

---

## 👤 Author

**Xuan Toan Nguyen**  
IT Support | Service Desk | Desktop Support | System Administration  
Adelaide, South Australia

- 🔗 LinkedIn: [www.linkedin.com/in/toan-nguyen-it-oz](https://www.linkedin.com/in/toan-nguyen-it-oz)
- 💻 GitHub: [github.com/toannguyenitoz](https://github.com/toannguyenitoz)

---

<p align="center"><a href="../06-active-directory-ou-structure/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../08-active-directory-group-management/README.md">Next Lab ➜</a> · <a href="#top">⬆ Back to Top</a></p>