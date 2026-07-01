<a id="top"></a>

# 👥 Lab 08 — Active Directory Group Management

<p align="center">
  <img src="https://img.shields.io/badge/Active%20Directory-Groups-6A1B9A" alt="Active Directory Group Management">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-2E7D32" alt="Guide">
  <img src="https://img.shields.io/badge/Level-Intermediate-F9A825" alt="Intermediate">
</p>

<p align="center"><a href="../07-active-directory-user-management/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../09-password-lockout-logon-controls/README.md">Next Lab ➜</a></p>

---

## 🎯 Lab Mission

Create and manage security groups for cleaner access management.

> [!NOTE]
> This lab is written as a user guide. Follow the steps in order and compare your result with the expected checks.

## ✅ What You Will Learn

- Create global and domain local groups.
- Use a clear naming standard.
- Add users to groups.
- Verify membership.

## 🧱 Lab Values

| Item | Value |
|---|---|
| Global group | `GG_StandardUsers` |
| IT group | `GG_ITSupport` |
| Access groups | `DL_SharedData_Read`, `DL_SharedData_Modify` |

## 🧩 Before You Start

- Confirm Groups OU exists.
- Confirm `j.smith` exists.

> [!WARNING]
> Use a lab environment only. Do not publish real passwords, personal information, client data or internal business details.

## 🚀 Step-by-Step Guide

### 🧰 Step 1 — Open Groups OU

Browse to `corp.local > Company > Groups`.

> [!TIP]
> Groups should be created in a dedicated OU.

### ➕ Step 2 — Create standard users group

Create `GG_StandardUsers` as a Global Security group.

> [!TIP]
> Global groups commonly hold users.

### 🛠️ Step 3 — Create IT support group

Create `GG_ITSupport`.

> [!TIP]
> Useful for support role scenarios.

### 👤 Step 4 — Add user to group

Add `j.smith` to `GG_StandardUsers`.

> [!TIP]
> Group membership drives access.

### 🔍 Step 5 — Review Member Of

Open the user and review the Member Of tab.

> [!TIP]
> Verify membership from the user view.

### 💻 Step 6 — Confirm with PowerShell

Run membership check.

Run:

```powershell
Get-ADGroupMember GG_StandardUsers
```

> [!TIP]
> The test user should appear.

### 📁 Step 7 — Create access groups

Create `DL_SharedData_Read` and `DL_SharedData_Modify`.

> [!TIP]
> These are used in the file share lab.

---

## 🧾 Command Reference

| Command | Run on | Purpose | Expected result |
|---|---|---|---|
| `Get-ADGroupMember GG_StandardUsers` | Server | Lists group members | Shows `j.smith` |

---

## ✅ Completion Checklist

- [ ] Groups created.
- [ ] User added to group.
- [ ] User membership reviewed.
- [ ] Membership confirmed with PowerShell.
- [ ] Access groups created.

---

## 🧠 Key Takeaways

| Key point | Why it matters |
|---|---|
| 1 | Groups make permission management easier. |
| 2 | Naming standards explain group purpose. |
| 3 | Membership can be verified from multiple views. |

---

## 👤 Author

**Xuan Toan Nguyen**  
IT Support | Service Desk | Desktop Support | System Administration  
Adelaide, South Australia

- 🔗 LinkedIn: [www.linkedin.com/in/toan-nguyen-it-oz](https://www.linkedin.com/in/toan-nguyen-it-oz)
- 💻 GitHub: [github.com/toannguyenitoz](https://github.com/toannguyenitoz)

---

<p align="center"><a href="../07-active-directory-user-management/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../09-password-lockout-logon-controls/README.md">Next Lab ➜</a> · <a href="#top">⬆ Back to Top</a></p>