<a id="top"></a>

# 👤 Lab 07 — Active Directory User Management

<p align="center">
  <img src="https://img.shields.io/badge/Active%20Directory-Users-6A1B9A" alt="Active Directory User Management">
  <img src="https://img.shields.io/badge/PowerShell-Automation-5391FE?logo=powershell&logoColor=white" alt="PowerShell Automation">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-2E7D32" alt="Guide">
  <img src="https://img.shields.io/badge/Level-Intermediate-F9A825" alt="Intermediate">
</p>

<p align="center"><a href="../06-active-directory-ou-structure/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../08-active-directory-group-management/README.md">Next Lab ➜</a></p>

---

## 🎯 Lab Mission

Create and manage sample Active Directory domain users for a small workplace-style environment.

This lab can be completed in two ways:

1. **GUI method** — manually create users and update user properties using **Active Directory Users and Computers (ADUC)**.
2. **PowerShell method** — create, verify and manage users using scripts.

> [!NOTE]
> Screenshots show final results and verification evidence. The GUI text explains the complete manual steps to create users, set attributes and manage account state.

---

## ✅ What You Will Learn

- Create multiple domain users with ADUC or PowerShell.
- Place users into the correct OU structure.
- Configure user attributes such as department and job title.
- Create enabled standard users, an admin user and a disabled user example.
- Verify users with PowerShell.
- Review user properties in ADUC.
- Perform common account lifecycle tasks such as disable, enable, reset password and force password change.

---

## 🧱 Lab Values

| Item | Value |
|---|---|
| Domain | `W2K16AD.local` |
| Domain Controller | `SRV-DC01` |
| Company OU | `AdelaideTechSolutions` |
| Standard Users OU | `AdelaideTechSolutions > Users > StandardUsers` |
| Admin Users OU | `AdelaideTechSolutions > Users > AdminUsers` |
| Disabled Users OU | `AdelaideTechSolutions > Users > DisabledUsers` |

---

## 👥 Users Created in This Lab

| User | Username | OU | Department | Title | State |
|---|---|---|---|---|---|
| John Smith | `john.smith` | `StandardUsers` | IT | IT Support Technician | Enabled |
| Mary Johnson | `mary.johnson` | `StandardUsers` | HR | HR Coordinator | Enabled |
| David Lee | `david.lee` | `StandardUsers` | Finance | Finance Officer | Enabled |
| Sarah Brown | `sarah.brown` | `StandardUsers` | Sales | Sales Representative | Enabled |
| Helpdesk Admin | `admin.helpdesk` | `AdminUsers` | IT | Helpdesk Administrator | Enabled |
| Former User | `former.user` | `DisabledUsers` | Operations | Former Employee | Disabled |

---

## 🧩 Before You Start

- Complete **Lab 06 — Active Directory OU Structure**.
- Confirm these OUs exist:

```text
AdelaideTechSolutions > Users > StandardUsers
AdelaideTechSolutions > Users > AdminUsers
AdelaideTechSolutions > Users > DisabledUsers
```

- Sign in to `SRV-DC01` using a domain administrator account.
- Open PowerShell as Administrator if using scripts.
- Open PowerShell from the repository root folder, or change directory to the repository root before running scripts.

> [!WARNING]
> Use a lab environment only. Do not publish real passwords, personal information, client data or internal business details.

---

## 🧰 Scripts Used in This Lab

| Script | Purpose |
|---|---|
| [`create-lab07-ad-users.ps1`](../../scripts/create-lab07-ad-users.ps1) | Creates or updates the Lab 07 sample users. |
| [`verify-lab07-ad-users.ps1`](../../scripts/verify-lab07-ad-users.ps1) | Verifies the expected users, OU location and enabled/disabled state. |
| [`manage-lab07-user-lifecycle.ps1`](../../scripts/manage-lab07-user-lifecycle.ps1) | Demonstrates disable, enable, reset password and force password change actions. |

> [!TIP]
> The examples below avoid fixed local drive paths. They assume you are already in the repository root folder. This makes the guide portable on any drive or computer.

---

# Method 1 — Detailed GUI Step-by-Step Guide

Use this method to practise manual user creation and account management in ADUC. The screenshots still show the final result, but the steps below describe the full GUI process.

---

## 🖱️ Step 1 — Open the StandardUsers OU

1. Sign in to `SRV-DC01`.
2. Open **Server Manager**.
3. Click **Tools**.
4. Open **Active Directory Users and Computers**.
5. Expand:

```text
W2K16AD.local > AdelaideTechSolutions > Users > StandardUsers
```

6. Confirm you are in the correct OU before creating standard user accounts.

![Open StandardUsers OU](../../assets/images/lab-07-active-directory-user-management/01-open-standard-users-ou.png)

---

## 👤 Step 2 — Create standard users manually

Create the four standard users inside:

```text
AdelaideTechSolutions > Users > StandardUsers
```

For each user:

1. Right-click `StandardUsers`.
2. Select:

```text
New > User
```

3. Enter the user's name details.
4. Enter the **User logon name**.
5. Click **Next**.
6. Enter a temporary lab password.
7. Confirm the password.
8. Select:

```text
User must change password at next logon
```

9. Leave the account enabled.
10. Click **Next**.
11. Review the summary.
12. Click **Finish**.

Create these users:

| First name | Last name | User logon name | OU |
|---|---|---|---|
| John | Smith | `john.smith` | `StandardUsers` |
| Mary | Johnson | `mary.johnson` | `StandardUsers` |
| David | Lee | `david.lee` | `StandardUsers` |
| Sarah | Brown | `sarah.brown` | `StandardUsers` |

Expected result in ADUC:

```text
John Smith
Mary Johnson
David Lee
Sarah Brown
```

![Standard users created](../../assets/images/lab-07-active-directory-user-management/02-standard-users-created.png)

> [!TIP]
> In a workplace, a user creation request should come from an approved onboarding ticket or HR process.

---

## 📝 Step 3 — Add department and title details to standard users

After creating the users, update their properties so the accounts are useful for support and administration.

For each standard user:

1. Right-click the user.
2. Select **Properties**.
3. Open the **Organization** tab.
4. Enter the user's **Title**.
5. Enter the user's **Department**.
6. Click **Apply**.
7. Click **OK**.

Use these values:

| User | Department | Title |
|---|---|---|
| John Smith | IT | IT Support Technician |
| Mary Johnson | HR | HR Coordinator |
| David Lee | Finance | Finance Officer |
| Sarah Brown | Sales | Sales Representative |

---

## 🛡️ Step 4 — Create the admin user manually

Create a separate delegated admin-style account inside:

```text
AdelaideTechSolutions > Users > AdminUsers
```

1. In ADUC, browse to:

```text
W2K16AD.local > AdelaideTechSolutions > Users > AdminUsers
```

2. Right-click `AdminUsers`.
3. Select:

```text
New > User
```

4. Enter:

| Field | Value |
|---|---|
| First name | `Helpdesk` |
| Last name | `Admin` |
| Full name | `Helpdesk Admin` |
| User logon name | `admin.helpdesk` |

5. Click **Next**.
6. Enter a temporary lab password.
7. Select **User must change password at next logon**.
8. Click **Next**.
9. Click **Finish**.
10. Right-click `Helpdesk Admin` and open **Properties**.
11. Open the **Organization** tab.
12. Set:

| Field | Value |
|---|---|
| Title | `Helpdesk Administrator` |
| Department | `IT` |

13. Click **OK**.

![Admin users created](../../assets/images/lab-07-active-directory-user-management/03-admin-users-created.png)

> [!TIP]
> Keep admin-style accounts separate from normal user accounts. This makes auditing and management easier.

---

## ⛔ Step 5 — Create and disable a former user account

Create a disabled account example inside:

```text
AdelaideTechSolutions > Users > DisabledUsers
```

1. Browse to:

```text
W2K16AD.local > AdelaideTechSolutions > Users > DisabledUsers
```

2. Right-click `DisabledUsers`.
3. Select:

```text
New > User
```

4. Enter:

| Field | Value |
|---|---|
| First name | `Former` |
| Last name | `User` |
| Full name | `Former User` |
| User logon name | `former.user` |

5. Click **Next**.
6. Enter a temporary lab password.
7. Click **Next**.
8. Click **Finish**.
9. Right-click `Former User`.
10. Select **Disable Account**.
11. Confirm the action if prompted.
12. The user icon should show the disabled account indicator.

Optionally update the **Organization** tab:

| Field | Value |
|---|---|
| Title | `Former Employee` |
| Department | `Operations` |

![Disabled users created](../../assets/images/lab-07-active-directory-user-management/04-disabled-users-created.png)

> [!TIP]
> In real environments, disabled users are often retained for a period before deletion depending on policy, audit and mailbox/data retention requirements.

---

## 🧾 Step 6 — Review a user properties example

Open the properties of `John Smith` and review the account information.

1. Browse to:

```text
W2K16AD.local > AdelaideTechSolutions > Users > StandardUsers
```

2. Right-click `John Smith`.
3. Select **Properties**.
4. Review the **General** tab.
5. Review the **Account** tab.
6. Review the **Organization** tab.
7. Confirm:

```text
Title: IT Support Technician
Department: IT
User logon name: john.smith@W2K16AD.local
```

8. Click **OK** or **Cancel** after reviewing.

![User properties example](../../assets/images/lab-07-active-directory-user-management/05-user-properties-example.png)

---

## 🧪 Step 7 — Verify users with PowerShell

Open **PowerShell as Administrator** on `SRV-DC01`.

From the repository root folder, run:

```powershell
Set-Location .\scripts
.\verify-lab07-ad-users.ps1
```

Expected result:

```text
PASS
```

for all Lab 07 users.

![Verify users with PowerShell](../../assets/images/lab-07-active-directory-user-management/06-verify-users-powershell.png)

---

## 📋 Step 8 — Optional PowerShell user list

Run:

```powershell
Get-ADUser -Filter * -SearchBase "OU=Users,OU=AdelaideTechSolutions,DC=W2K16AD,DC=local" -Properties Department,Title,Enabled |
Select-Object Name,SamAccountName,Department,Title,Enabled |
Sort-Object SamAccountName |
Format-Table -AutoSize
```

![List users with PowerShell](../../assets/images/lab-07-active-directory-user-management/07-list-users-powershell.png)

---

# Method 2 — Recommended Script Workflow

Use this method if you want to complete the lab faster and demonstrate automation skills.

## ⚙️ Script Step 1 — Run the user creation script

Run on `SRV-DC01` from the repository root folder:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope Process
Set-Location .\scripts
.\create-lab07-ad-users.ps1
```

When prompted, enter a temporary password for the lab users. The password is entered securely and is not stored in the script.

---

## 🔍 Script Step 2 — Verify the users

Run from the `scripts` folder:

```powershell
.\verify-lab07-ad-users.ps1
```

---

## 🔐 Script Step 3 — Optional user lifecycle examples

Show a user:

```powershell
.\manage-lab07-user-lifecycle.ps1 -Action Show -SamAccountName john.smith
```

Disable a user:

```powershell
.\manage-lab07-user-lifecycle.ps1 -Action Disable -SamAccountName former.user
```

Enable a user:

```powershell
.\manage-lab07-user-lifecycle.ps1 -Action Enable -SamAccountName former.user
```

Reset a user password:

```powershell
.\manage-lab07-user-lifecycle.ps1 -Action ResetPassword -SamAccountName john.smith
```

Force password change at next logon:

```powershell
.\manage-lab07-user-lifecycle.ps1 -Action ForcePasswordChange -SamAccountName john.smith
```

---

## 🧯 Troubleshooting

### ActiveDirectory module is not found

Run the scripts on the Domain Controller, or install RSAT tools on an admin workstation.

```powershell
Get-Module -ListAvailable ActiveDirectory
```

### Required OU not found

Run the Lab 06 OU creation script first from the `scripts` folder:

```powershell
.\create-lab06-ou-structure.ps1
```

### User already exists

This is not an error. The script updates existing users instead of creating duplicates.

### Access is denied

Use a domain administrator account or an account delegated to create and manage users.

### Password does not meet complexity requirements

Use a stronger temporary lab password that meets the domain password policy.

---

## 🧾 Command Reference

| Command | Run on | Purpose | Expected result |
|---|---|---|---|
| `New-ADUser` | Server | Creates AD users | New users appear in ADUC |
| `Set-ADUser` | Server | Updates user attributes | Department, title and settings updated |
| `Disable-ADAccount` | Server | Disables a user account | User cannot sign in |
| `Enable-ADAccount` | Server | Enables a user account | User can sign in again |
| `Set-ADAccountPassword` | Server | Resets password | New temporary password is set |
| `Get-ADUser` | Server | Verifies user details | User details are returned |
| `create-lab07-ad-users.ps1` | Server | Creates or updates lab users | Users created in correct OUs |
| `verify-lab07-ad-users.ps1` | Server | Verifies users | PASS for expected users |
| `manage-lab07-user-lifecycle.ps1` | Server | Performs account support actions | Account state changes as expected |

---

## ✅ Completion Checklist

- [ ] Lab 06 OU structure completed.
- [ ] Standard users created in `StandardUsers`.
- [ ] Admin user created in `AdminUsers`.
- [ ] Disabled user created in `DisabledUsers`.
- [ ] Department and title attributes configured.
- [ ] User properties reviewed.
- [ ] Users verified with PowerShell.
- [ ] Optional lifecycle management script tested.

---

## 🧠 Key Takeaways

| Key point | Why it matters |
|---|---|
| 1 | Users should be created in the correct OU. |
| 2 | User attributes such as department and title help support and administration. |
| 3 | Disabled user examples are useful for account lifecycle practice. |
| 4 | PowerShell makes user creation repeatable and consistent. |
| 5 | Verification scripts improve documentation and troubleshooting quality. |

---

## 👤 Author

**Xuan Toan Nguyen**  
IT Support | Service Desk | Desktop Support | System Administration  
Adelaide, South Australia

- 🔗 LinkedIn: [www.linkedin.com/in/toan-nguyen-it-oz](https://www.linkedin.com/in/toan-nguyen-it-oz)
- 💻 GitHub: [github.com/toannguyenitoz](https://github.com/toannguyenitoz)

---

<p align="center"><a href="../06-active-directory-ou-structure/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../08-active-directory-group-management/README.md">Next Lab ➜</a> · <a href="#top">⬆ Back to Top</a></p>
