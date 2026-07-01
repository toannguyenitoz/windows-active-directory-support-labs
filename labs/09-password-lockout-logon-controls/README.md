<a id="top"></a>

# 🔐 Lab 09 — Password, Lockout and Logon Controls

<p align="center">
  <img src="https://img.shields.io/badge/Active%20Directory-Account%20Support-6A1B9A" alt="Password, Lockout and Logon Controls">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-2E7D32" alt="Guide">
  <img src="https://img.shields.io/badge/Level-Intermediate-F9A825" alt="Intermediate">
</p>

<p align="center"><a href="../08-active-directory-group-management/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../10-home-folder-and-file-share/README.md">Next Lab ➜</a></p>

---

## 🎯 Lab Mission

Practise common account support tasks in Active Directory.

> [!NOTE]
> This lab is written as a user guide. Follow the steps in order and compare your result with the expected checks.

## ✅ What You Will Learn

- Review account properties.
- Reset a lab password.
- Review lockout state.
- Disable and enable an account.
- Review logon controls.

## 🧱 Lab Values

| Item | Value |
|---|---|
| User | `j.smith` |
| Client | `W11-CLIENT01` |
| Domain | `corp.local` |

## 🧩 Before You Start

- Use a lab account only.
- Complete user and group labs first.

> [!WARNING]
> Use a lab environment only. Do not publish real passwords, personal information, client data or internal business details.

## 🚀 Step-by-Step Guide

### 🧰 Step 1 — Open the user account

Open `j.smith` in ADUC.

> [!TIP]
> Always verify the account before changing it.

### 🔍 Step 2 — Review Account tab

Review logon name, account options, expiry and logon hours.

> [!TIP]
> This tab is central to account access support.

### 🔑 Step 3 — Reset lab password

Reset the password using a lab-safe temporary password.

> [!TIP]
> In real workplaces, follow identity verification policy.

### 👤 Step 4 — Test sign-in

Test the new password from the client.

> [!TIP]
> Testing confirms the support action worked.

### 🚫 Step 5 — Review lockout state

If locked, review and unlock only when appropriate.

> [!TIP]
> Understand lockout behavior before changing settings.

### ⛔ Step 6 — Disable the account

Disable the account and observe sign-in behavior.

> [!TIP]
> Disabling blocks normal sign-in.

### ✅ Step 7 — Enable the account again

Enable the account and confirm access is restored.

> [!TIP]
> Return the lab to a usable state.

### 🕒 Step 8 — Review logon hours and expiry

Open Logon Hours and Account Expires.

> [!TIP]
> Useful for temporary or restricted access.

### 📝 Step 9 — Write a support note

Record what was checked, changed and confirmed.

> [!TIP]
> Documentation is part of the support task.

---

## 🧾 Command Reference

| Command | Run on | Purpose | Expected result |
|---|---|---|---|
| `whoami` | Client | Confirms signed-in user | Shows domain user after login |
| `gpupdate /force` | Client | Refreshes policy when needed | Policy refresh completes |

---

## ✅ Completion Checklist

- [ ] Account tab reviewed.
- [ ] Password reset practised.
- [ ] Sign-in test completed.
- [ ] Lockout state reviewed.
- [ ] Disable test completed.
- [ ] Account enabled again.
- [ ] Logon controls reviewed.
- [ ] Support note written.

---

## 🧠 Key Takeaways

| Key point | Why it matters |
|---|---|
| 1 | Account tasks should be documented. |
| 2 | Password reset and unlock actions should follow policy. |
| 3 | Disabling an account quickly stops normal sign-in. |

---

## 👤 Author

**Xuan Toan Nguyen**  
IT Support | Service Desk | Desktop Support | System Administration  
Adelaide, South Australia

- 🔗 LinkedIn: [www.linkedin.com/in/toan-nguyen-it-oz](https://www.linkedin.com/in/toan-nguyen-it-oz)
- 💻 GitHub: [github.com/toannguyenitoz](https://github.com/toannguyenitoz)

---

<p align="center"><a href="../08-active-directory-group-management/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../10-home-folder-and-file-share/README.md">Next Lab ➜</a> · <a href="#top">⬆ Back to Top</a></p>