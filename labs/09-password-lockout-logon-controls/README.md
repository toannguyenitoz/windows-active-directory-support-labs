<a id="top"></a>

# 🔐 Lab 09 — Password, Lockout and Logon Controls

<p align="center">
  <img src="https://img.shields.io/badge/Active%20Directory-Account%20Support-6A1B9A" alt="Password, Lockout and Logon Controls">
  <img src="https://img.shields.io/badge/PowerShell-Automation-5391FE?logo=powershell&logoColor=white" alt="PowerShell Automation">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-2E7D32" alt="Guide">
  <img src="https://img.shields.io/badge/Level-Intermediate-F9A825" alt="Intermediate">
</p>

<p align="center"><a href="../08-active-directory-group-management/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../10-home-folder-and-file-share/README.md">Next Lab ➜</a></p>

---

## 🎯 Lab Mission

Practise common Active Directory account support tasks related to password policy, account lockout, password reset, disable/enable actions and logon controls.

This lab uses **PowerShell automation as the main method** and uses **Active Directory Users and Computers (ADUC)** screenshots as visual evidence.

> [!NOTE]
> This is a lab environment. In a real workplace, password reset, unlock and account access changes must follow identity verification, approval and audit procedures.

---

## ✅ What You Will Learn

- Configure a lab password and account lockout policy.
- Create a dedicated test user for lockout and password reset practice.
- Review Account tab settings in ADUC.
- Reset a user password without storing passwords in scripts.
- Force password change at next logon.
- Disable and enable a user account.
- Unlock a locked account.
- Set or clear account expiration.
- Verify policy and account state with PowerShell.

---

## 🧱 Lab Values

| Item | Value |
|---|---|
| Domain | `W2K16AD.local` |
| Domain Controller | `SRV-DC01` |
| Client | `W11-CLIENT01` |
| Company OU | `AdelaideTechSolutions` |
| Test user | `lockout.test` |
| Test user display name | `Lockout Test User` |
| Test user OU | `AdelaideTechSolutions > Users > StandardUsers` |

---

## 🔐 Lab Policy Settings

| Setting | Lab value |
|---|---|
| Password complexity | Enabled |
| Minimum password length | `10` |
| Password history | `5` |
| Maximum password age | `90 days` |
| Minimum password age | `0 days` |
| Lockout threshold | `5 invalid attempts` |
| Lockout duration | `15 minutes` |
| Lockout observation window | `15 minutes` |

> [!WARNING]
> This changes the default domain password and lockout policy in the lab domain. Do not run this in a production environment.

---

## 🧩 Before You Start

- Complete **Lab 06 — Active Directory OU Structure**.
- Complete **Lab 07 — Active Directory User Management**.
- Confirm this OU exists:

```text
AdelaideTechSolutions > Users > StandardUsers
```

- Sign in to `SRV-DC01` using a domain administrator account.
- Open PowerShell as Administrator.
- Open PowerShell from the repository root folder, or change directory to the repository root before running scripts.

> [!WARNING]
> Use a lab environment only. Do not publish real passwords, personal information, client data or internal business details.

---

## 🧰 Scripts Used in This Lab

| Script | Purpose |
|---|---|
| [`configure-lab09-password-lockout-policy.ps1`](../../scripts/configure-lab09-password-lockout-policy.ps1) | Configures the lab password and account lockout policy. |
| [`create-lab09-lockout-test-user.ps1`](../../scripts/create-lab09-lockout-test-user.ps1) | Creates or updates the `lockout.test` account. |
| [`manage-lab09-account-controls.ps1`](../../scripts/manage-lab09-account-controls.ps1) | Performs show, reset password, unlock, disable, enable and expiry actions. |
| [`verify-lab09-account-controls.ps1`](../../scripts/verify-lab09-account-controls.ps1) | Verifies password policy and account state. |

> [!TIP]
> The examples below avoid fixed local drive paths. They assume you are already in the repository root folder. This makes the guide portable on any drive or computer.

---

# Method 1 — Recommended Script Workflow

## ⚙️ Step 1 — Configure password and lockout policy

Run on `SRV-DC01` from the repository root folder:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope Process
Set-Location .\scripts
.\configure-lab09-password-lockout-policy.ps1
```

Expected result:

```text
Lab 09 policy configuration completed.
```

---

## 👤 Step 2 — Create the lockout test user

Run from the `scripts` folder:

```powershell
.\create-lab09-lockout-test-user.ps1
```

When prompted, enter a temporary lab password. The password is entered securely and is not stored in the script.

Expected result:

```text
Lab 09 lockout test user ready.
```

---

## 🔍 Step 3 — Verify policy and account state

Run from the `scripts` folder:

```powershell
.\verify-lab09-account-controls.ps1
```

Expected result:

```text
PASS
Verification complete: Lab 09 policy and account controls match the expected lab state.
```

---

## 🛠️ Step 4 — Practise common account support actions

Show account state:

```powershell
.\manage-lab09-account-controls.ps1 -Action Show -SamAccountName lockout.test
```

Reset password:

```powershell
.\manage-lab09-account-controls.ps1 -Action ResetPassword -SamAccountName lockout.test
```

Force password change at next logon:

```powershell
.\manage-lab09-account-controls.ps1 -Action ForcePasswordChange -SamAccountName lockout.test
```

Unlock account:

```powershell
.\manage-lab09-account-controls.ps1 -Action Unlock -SamAccountName lockout.test
```

Disable account:

```powershell
.\manage-lab09-account-controls.ps1 -Action Disable -SamAccountName lockout.test
```

Enable account:

```powershell
.\manage-lab09-account-controls.ps1 -Action Enable -SamAccountName lockout.test
```

Set account expiry:

```powershell
.\manage-lab09-account-controls.ps1 -Action SetExpiry -SamAccountName lockout.test -ExpiryDate "2030-12-31"
```

Clear account expiry:

```powershell
.\manage-lab09-account-controls.ps1 -Action ClearExpiry -SamAccountName lockout.test
```

---

# Method 2 — GUI Review and Screenshot Evidence

After running the scripts, use ADUC and PowerShell to capture evidence.

---

## 🖱️ Step 1 — Open the test user in ADUC

Open:

```text
Server Manager > Tools > Active Directory Users and Computers
```

Browse to:

```text
W2K16AD.local > AdelaideTechSolutions > Users > StandardUsers
```

Confirm this user exists:

```text
Lockout Test User
```

![Open lockout test user](../../assets/images/lab-09-password-lockout-logon-controls/01-open-lockout-test-user.png)

---

## 🔐 Step 2 — Show password and lockout policy

Run:

```powershell
Get-ADDefaultDomainPasswordPolicy |
Select-Object ComplexityEnabled,MinPasswordLength,PasswordHistoryCount,MaxPasswordAge,LockoutThreshold,LockoutDuration,LockoutObservationWindow |
Format-List
```

![Password and lockout policy](../../assets/images/lab-09-password-lockout-logon-controls/02-password-lockout-policy-powershell.png)

---

## 👤 Step 3 — Show test user state

Run:

```powershell
.\manage-lab09-account-controls.ps1 -Action Show -SamAccountName lockout.test
```

![Test user state](../../assets/images/lab-09-password-lockout-logon-controls/03-test-user-state-powershell.png)

---

## 🧾 Step 4 — Review the Account tab

In ADUC, right-click:

```text
Lockout Test User > Properties > Account
```

Review:

```text
User logon name
Account options
Account expires
Unlock account option
```

![Review Account tab](../../assets/images/lab-09-password-lockout-logon-controls/04-review-account-tab.png)

---

## 🔑 Step 5 — Reset password demonstration

Run:

```powershell
.\manage-lab09-account-controls.ps1 -Action ResetPassword -SamAccountName lockout.test
```

Enter a temporary lab password when prompted.

Expected result:

```text
Password reset completed. User must change password at next logon.
```

![Reset password demonstration](../../assets/images/lab-09-password-lockout-logon-controls/05-reset-password-powershell.png)

---

## ⛔ Step 6 — Disable account demonstration

Run:

```powershell
.\manage-lab09-account-controls.ps1 -Action Disable -SamAccountName lockout.test
```

Then review the user in ADUC. The account should show as disabled.

![Disabled account example](../../assets/images/lab-09-password-lockout-logon-controls/06-disabled-account-example.png)

---

## ✅ Step 7 — Enable or unlock account demonstration

Run:

```powershell
.\manage-lab09-account-controls.ps1 -Action Enable -SamAccountName lockout.test
.\manage-lab09-account-controls.ps1 -Action Unlock -SamAccountName lockout.test
```

![Enable and unlock account](../../assets/images/lab-09-password-lockout-logon-controls/07-enable-unlock-account-powershell.png)

---

## 🧪 Step 8 — Final verification

Run:

```powershell
.\verify-lab09-account-controls.ps1
```

![Verify account controls](../../assets/images/lab-09-password-lockout-logon-controls/08-verify-account-controls-powershell.png)

---

## 🧯 Troubleshooting

### ActiveDirectory module is not found

Run the scripts on the Domain Controller, or install RSAT tools on an admin workstation.

Check:

```powershell
Get-Module -ListAvailable ActiveDirectory
```

### Required OU not found

Run the Lab 06 OU creation script first from the `scripts` folder:

```powershell
.\create-lab06-ou-structure.ps1
```

### Password does not meet complexity requirements

Use a stronger temporary password that matches the lab password policy.

### Account is disabled after testing

Run:

```powershell
.\manage-lab09-account-controls.ps1 -Action Enable -SamAccountName lockout.test
```

### Account is locked out

Run:

```powershell
.\manage-lab09-account-controls.ps1 -Action Unlock -SamAccountName lockout.test
```

---

## 🧾 Command Reference

| Command | Run on | Purpose | Expected result |
|---|---|---|---|
| `Get-ADDefaultDomainPasswordPolicy` | Server | Shows domain password and lockout policy | Policy values displayed |
| `Set-ADDefaultDomainPasswordPolicy` | Server | Configures domain password and lockout policy | Policy updated |
| `New-ADUser` | Server | Creates test user | User appears in ADUC |
| `Set-ADAccountPassword` | Server | Resets user password | Password reset completed |
| `Set-ADUser -ChangePasswordAtLogon` | Server | Forces password change | User must change password next logon |
| `Unlock-ADAccount` | Server | Unlocks user account | LockedOut becomes False |
| `Disable-ADAccount` | Server | Disables user account | Enabled becomes False |
| `Enable-ADAccount` | Server | Enables user account | Enabled becomes True |
| `Set-ADAccountExpiration` | Server | Sets account expiry | Expiry date configured |
| `Clear-ADAccountExpiration` | Server | Removes account expiry | Expiry cleared |

---

## ✅ Completion Checklist

- [ ] Password and lockout policy configured.
- [ ] `lockout.test` user created.
- [ ] Test user reviewed in ADUC.
- [ ] Account tab reviewed.
- [ ] Password reset practised.
- [ ] Force password change tested.
- [ ] Disable and enable actions tested.
- [ ] Unlock action reviewed.
- [ ] Final verification completed.

---

## 🧠 Key Takeaways

| Key point | Why it matters |
|---|---|
| 1 | Password and lockout settings protect accounts from weak passwords and repeated failed logons. |
| 2 | Password resets should never expose or store passwords in scripts. |
| 3 | Unlock, disable and enable actions are common Service Desk tasks. |
| 4 | Account changes should be verified and documented. |
| 5 | Scripts make account support tasks repeatable and easier to audit. |

---

## 👤 Author

**Xuan Toan Nguyen**  
IT Support | Service Desk | Desktop Support | System Administration  
Adelaide, South Australia

- 🔗 LinkedIn: [www.linkedin.com/in/toan-nguyen-it-oz](https://www.linkedin.com/in/toan-nguyen-it-oz)
- 💻 GitHub: [github.com/toannguyenitoz](https://github.com/toannguyenitoz)

---

<p align="center"><a href="../08-active-directory-group-management/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../10-home-folder-and-file-share/README.md">Next Lab ➜</a> · <a href="#top">⬆ Back to Top</a></p>
