<a id="top"></a>

# 🔐 Lab 09 — Password, Lockout and Logon Controls

<p align="center">
  <img src="https://img.shields.io/badge/Active%20Directory-Account%20Support-6A1B9A" alt="Active Directory Account Support">
  <img src="https://img.shields.io/badge/Group%20Policy-Password%20Policy-1565C0" alt="Group Policy Password Policy">
  <img src="https://img.shields.io/badge/PowerShell-Verification-5391FE?logo=powershell&logoColor=white" alt="PowerShell Verification">
  <img src="https://img.shields.io/badge/IT%20Support-Service%20Desk-2E7D32" alt="IT Support Service Desk">
  <img src="https://img.shields.io/badge/Level-Intermediate-F9A825" alt="Intermediate">
</p>

<p align="center">
  <strong>Hands-on Active Directory lab for password policy, account lockout, password reset, account enable/disable and unlock workflows.</strong>
</p>

<p align="center">
  <a href="../08-active-directory-group-management/README.md">⬅ Previous Lab</a> ·
  <a href="../../README.md">🏠 Main README</a> ·
  <a href="../10-home-folder-and-file-share/README.md">Next Lab ➜</a>
</p>

---

## 🎯 Lab Mission

This lab demonstrates how an IT Support, Service Desk or junior System Administrator can manage common Active Directory account support tasks in a Windows domain environment.

The lab covers:

- Domain password policy review
- Account lockout policy review
- User account properties review
- Password reset workflow
- User account disable and enable workflow
- Lockout simulation from a Windows 11 domain client
- Locked account verification in ADUC
- Account unlock workflow
- PowerShell verification

> [!NOTE]
> This is a lab environment. In a real workplace, password resets, unlock requests and account access changes must follow identity verification, approval and audit procedures.

---

## 🧱 Lab Environment

| Component | Value |
|---|---|
| Domain | `W2K16AD.local` |
| NetBIOS name | `W2K16AD` |
| Domain Controller | `SRV-DC01` |
| Windows Client | `W11-CLIENT01` |
| Server IP | `192.168.20.10` |
| Client IP | `192.168.20.101` |
| Root OU | `AdelaideTechSolutions` |
| Test user | `lockout.test` |
| Test user display name | `Lockout Test User` |
| Test user OU | `AdelaideTechSolutions > Users > StandardUsers` |

---

## ✅ Skills Demonstrated

| Area | Skills |
|---|---|
| Active Directory Administration | Review user properties, reset passwords, disable users, enable users, unlock accounts |
| Group Policy Management | Review password policy and account lockout policy in Default Domain Policy |
| Service Desk Support | Handle locked account and password reset scenarios |
| Windows Client Testing | Simulate failed logon attempts from a domain-joined Windows 11 client |
| PowerShell Administration | Verify domain password policy and user account state |
| Documentation | Capture evidence screenshots and document support workflow |

---

## 🔐 Lab Policy Settings

The lab uses the following password and lockout settings.

| Setting | Lab value |
|---|---|
| Password complexity | Enabled |
| Minimum password length | `10` |
| Password history | `5` |
| Maximum password age | `90 days` |
| Minimum password age | `0 days` |
| Lockout threshold | `5 invalid logon attempts` |
| Lockout duration | `15 minutes` |
| Reset account lockout counter after | `15 minutes` |

> [!WARNING]
> Do not apply these settings directly to a production domain without business approval and security review. This lab is for training and portfolio demonstration only.

---

## 🧩 Before You Start

Complete these earlier labs first:

| Required lab | Purpose |
|---|---|
| Lab 04 — Active Directory Domain Services Setup | Domain Controller is available |
| Lab 05 — Join Windows 11 Client to Domain | Client can test domain logon |
| Lab 06 — Active Directory OU Structure | Required OU structure exists |
| Lab 07 — Active Directory User Management | User management basics completed |
| Lab 08 — Active Directory Group Management | Account support context completed |

Confirm this OU exists:

```text
W2K16AD.local
└── AdelaideTechSolutions
    └── Users
        └── StandardUsers
```

Sign in to `SRV-DC01` with a domain administrator account.

---

## 🧰 Scripts Used in This Lab

| Script | Purpose |
|---|---|
| [`configure-lab09-password-lockout-policy.ps1`](../../scripts/configure-lab09-password-lockout-policy.ps1) | Configures the lab domain password and account lockout policy. |
| [`create-lab09-lockout-test-user.ps1`](../../scripts/create-lab09-lockout-test-user.ps1) | Creates or updates the `lockout.test` user account. |
| [`manage-lab09-account-controls.ps1`](../../scripts/manage-lab09-account-controls.ps1) | Performs show, reset password, force password change, unlock, disable, enable and expiry actions. |
| [`verify-lab09-account-controls.ps1`](../../scripts/verify-lab09-account-controls.ps1) | Verifies the password policy and account state. |

> [!TIP]
> The commands below use relative paths. They do not depend on a specific local drive such as `D:\`. This makes the lab portable across different computers.

---

# Method 1 — PowerShell Workflow

## Step 1 — Open PowerShell as Administrator

Run PowerShell as Administrator on `SRV-DC01`.

From the repository root, run:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope Process
Set-Location .\scripts
```

---

## Step 2 — Configure Password and Lockout Policy

```powershell
.\configure-lab09-password-lockout-policy.ps1
```

Expected result:

```text
Lab 09 policy configuration completed.
```

This configures the lab domain password and account lockout policy.

---

## Step 3 — Create the Lockout Test User

```powershell
.\create-lab09-lockout-test-user.ps1
```

When prompted, enter a temporary lab password.

The password is entered securely and is not stored in the script.

Expected result:

```text
Lab 09 lockout test user ready.
```

---

## Step 4 — Verify Policy and User State

```powershell
.\verify-lab09-account-controls.ps1
```

Expected result:

```text
Verification complete: Lab 09 policy and account controls match the expected lab state.
```

---

## Step 5 — Practise Account Support Actions

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

Disable account:

```powershell
.\manage-lab09-account-controls.ps1 -Action Disable -SamAccountName lockout.test
```

Enable account:

```powershell
.\manage-lab09-account-controls.ps1 -Action Enable -SamAccountName lockout.test
```

Unlock account:

```powershell
.\manage-lab09-account-controls.ps1 -Action Unlock -SamAccountName lockout.test
```

---

# Method 2 — GUI Workflow and Screenshot Evidence

This section documents the full GUI workflow used for the screenshot evidence in this lab.

---

## Screenshot 01 — Open the Lockout Test User

Open:

```text
Server Manager
└── Tools
    └── Active Directory Users and Computers
```

Browse to:

```text
W2K16AD.local
└── AdelaideTechSolutions
    └── Users
        └── StandardUsers
```

Confirm the test user exists:

```text
Lockout Test User
```

![Open Lockout Test User](../../assets/images/lab-09-password-lockout-logon-controls/01-open-lockout-test-user.png)

<p align="right"><a href="#top">⬆ Back to Top</a></p>

---

## Screenshot 02 — Password Policy

Open:

```text
Group Policy Management
└── Forest: W2K16AD.local
    └── Domains
        └── W2K16AD.local
            └── Default Domain Policy
                └── Edit
```

Navigate to:

```text
Computer Configuration
└── Policies
    └── Windows Settings
        └── Security Settings
            └── Account Policies
                └── Password Policy
```

Review these settings:

- Enforce password history
- Maximum password age
- Minimum password age
- Minimum password length
- Password must meet complexity requirements
- Store passwords using reversible encryption

![Password Policy](../../assets/images/lab-09-password-lockout-logon-controls/02-password-policy.png)

<p align="right"><a href="#top">⬆ Back to Top</a></p>

---

## Screenshot 03 — Account Lockout Policy

Navigate to:

```text
Computer Configuration
└── Policies
    └── Windows Settings
        └── Security Settings
            └── Account Policies
                └── Account Lockout Policy
```

Review these settings:

- Account lockout duration
- Account lockout threshold
- Reset account lockout counter after

![Account Lockout Policy](../../assets/images/lab-09-password-lockout-logon-controls/03-account-lockout-policy.png)

<p align="right"><a href="#top">⬆ Back to Top</a></p>

---

## Screenshot 04 — Test User Properties: Account Tab

Open:

```text
Active Directory Users and Computers
└── AdelaideTechSolutions
    └── Users
        └── StandardUsers
            └── Lockout Test User
```

Right-click the user and open:

```text
Properties > Account
```

Review:

- User logon name
- Account options
- Account expires
- Unlock account option

![Test User Properties Account Tab](../../assets/images/lab-09-password-lockout-logon-controls/04-test-user-properties-account-tab.png)

<p align="right"><a href="#top">⬆ Back to Top</a></p>

---

## Screenshot 05 — Reset Password

In ADUC, right-click:

```text
Lockout Test User > Reset Password...
```

For the lab, reset the password and select:

```text
User must change password at next logon
```

This is a common Service Desk task after identity verification.

![Reset Password User](../../assets/images/lab-09-password-lockout-logon-controls/05-reset-password-user.png)

<p align="right"><a href="#top">⬆ Back to Top</a></p>

---

## Screenshot 06 — Disable Account Example

In ADUC, right-click:

```text
Lockout Test User > Disable Account
```

This simulates a support or security task where an account must be temporarily disabled.

![Disabled Account Example](../../assets/images/lab-09-password-lockout-logon-controls/06-disabled-account-example.png)

<p align="right"><a href="#top">⬆ Back to Top</a></p>

---

## Screenshot 07 — Enable Account Example

In ADUC, right-click:

```text
Lockout Test User > Enable Account
```

Confirm the account returns to normal enabled status.

![Enabled Account Example](../../assets/images/lab-09-password-lockout-logon-controls/07-enabled-account-example.png)

<p align="right"><a href="#top">⬆ Back to Top</a></p>

---

## Screenshot 08 — Lockout User Test

On `W11-CLIENT01`, attempt to sign in using:

```text
W2K16AD\lockout.test
```

or:

```text
lockout.test@W2K16AD.local
```

Enter an incorrect password five times.

Because the lockout threshold is `5 invalid logon attempts`, the account becomes locked.

Expected message:

```text
The referenced account is currently locked out and may not be logged on to.
```

![Lockout User Test](../../assets/images/lab-09-password-lockout-logon-controls/08-lockout-user-test.png)

<p align="right"><a href="#top">⬆ Back to Top</a></p>

---

## Screenshot 09 — Account Locked in ADUC

Return to `SRV-DC01`.

Open:

```text
Lockout Test User > Properties > Account
```

Confirm the account is locked:

```text
Unlock account. This account is currently locked out on this Active Directory Domain Controller.
```

![Account Locked in ADUC](../../assets/images/lab-09-password-lockout-logon-controls/09-account-locked-in-aduc.png)

<p align="right"><a href="#top">⬆ Back to Top</a></p>

---

## Screenshot 10 — Unlock Account in ADUC

In the Account tab, select the unlock option and click:

```text
Apply
```

or:

```text
OK
```

This restores the user account to a normal unlocked state.

![Unlock Account in ADUC](../../assets/images/lab-09-password-lockout-logon-controls/10-unlock-account-in-aduc.png)

<p align="right"><a href="#top">⬆ Back to Top</a></p>

---

## Screenshot 11 — Verify Unlocked User with PowerShell

Run on `SRV-DC01`:

```powershell
Get-ADUser lockout.test -Properties LockedOut,Enabled |
Select-Object Name,Enabled,LockedOut
```

Expected result:

```text
Name               Enabled  LockedOut
----               -------  ---------
Lockout Test User  True     False
```

![Verify Unlocked User PowerShell](../../assets/images/lab-09-password-lockout-logon-controls/11-verify-unlocked-user-powershell.png)

<p align="right"><a href="#top">⬆ Back to Top</a></p>

---

## Screenshot 12 — Verify Domain Password Policy with PowerShell

Run:

```powershell
Get-ADDefaultDomainPasswordPolicy
```

Review key settings:

- ComplexityEnabled
- LockoutDuration
- LockoutThreshold
- MaxPasswordAge
- MinPasswordLength
- PasswordHistoryCount

![Domain Password Policy PowerShell](../../assets/images/lab-09-password-lockout-logon-controls/12-domain-password-policy-powershell.png)

<p align="right"><a href="#top">⬆ Back to Top</a></p>

---

# Screenshot Checklist

| No. | Screenshot | Evidence |
|---:|---|---|
| 01 | `01-open-lockout-test-user.png` | Test user exists in ADUC |
| 02 | `02-password-policy.png` | Password Policy settings |
| 03 | `03-account-lockout-policy.png` | Account Lockout Policy settings |
| 04 | `04-test-user-properties-account-tab.png` | User Account tab reviewed |
| 05 | `05-reset-password-user.png` | Password reset workflow |
| 06 | `06-disabled-account-example.png` | Account disabled |
| 07 | `07-enabled-account-example.png` | Account enabled |
| 08 | `08-lockout-user-test.png` | Lockout tested on Windows 11 client |
| 09 | `09-account-locked-in-aduc.png` | Locked account confirmed in ADUC |
| 10 | `10-unlock-account-in-aduc.png` | Account unlocked in ADUC |
| 11 | `11-verify-unlocked-user-powershell.png` | User enabled and not locked |
| 12 | `12-domain-password-policy-powershell.png` | Domain password policy verified |

---

# Real-World Service Desk Scenario

## Example Ticket

```text
User reports they cannot log in after several failed password attempts.
```

## Support Workflow

| Step | Action |
|---|---|
| 1 | Verify the identity of the user according to company policy. |
| 2 | Check whether the account is disabled, expired or locked. |
| 3 | Unlock the account if approved. |
| 4 | Reset the password if required. |
| 5 | Select user must change password at next logon when appropriate. |
| 6 | Ask the user to test sign-in again. |
| 7 | Document the action taken in the ticket. |

## Example Case Note

```text
Verified user identity according to support procedure. Checked ADUC and confirmed the account was locked due to failed logon attempts. Unlocked the account and reset the temporary password. User was required to change password at next logon. User confirmed successful sign-in. Ticket resolved.
```

---

# Troubleshooting

## ActiveDirectory Module Not Found

Run the scripts on the Domain Controller, or install RSAT tools on an admin workstation.

Check:

```powershell
Get-Module -ListAvailable ActiveDirectory
```

---

## Group Policy Management Not Available

Install the Group Policy Management feature or use the Domain Controller where Group Policy Management is already available.

---

## Required OU Not Found

Run the Lab 06 OU creation script first:

```powershell
.\create-lab06-ou-structure.ps1
```

---

## Password Does Not Meet Complexity Requirements

Use a password that includes:

- Uppercase letter
- Lowercase letter
- Number
- Special character
- Minimum required length

Example format:

```text
Do not publish real passwords in screenshots or documentation.
```

---

## Account Is Still Locked

Run:

```powershell
Unlock-ADAccount -Identity lockout.test
```

Then verify:

```powershell
Get-ADUser lockout.test -Properties LockedOut,Enabled |
Select-Object Name,Enabled,LockedOut
```

---

## Account Is Disabled

Run:

```powershell
Enable-ADAccount -Identity lockout.test
```

Then verify:

```powershell
Get-ADUser lockout.test -Properties Enabled |
Select-Object Name,Enabled
```

---

# Command Reference

| Command | Purpose |
|---|---|
| `Get-ADDefaultDomainPasswordPolicy` | Shows domain password and account lockout policy. |
| `Set-ADDefaultDomainPasswordPolicy` | Configures domain password and lockout settings. |
| `Get-ADUser lockout.test -Properties LockedOut,Enabled` | Checks whether the test account is enabled or locked. |
| `Set-ADAccountPassword` | Resets an AD user password. |
| `Set-ADUser -ChangePasswordAtLogon` | Forces password change at next logon. |
| `Unlock-ADAccount` | Unlocks a locked AD user account. |
| `Disable-ADAccount` | Disables an AD user account. |
| `Enable-ADAccount` | Enables an AD user account. |

---

# Completion Checklist

- [x] Password Policy reviewed.
- [x] Account Lockout Policy reviewed.
- [x] `lockout.test` user confirmed in ADUC.
- [x] Account tab reviewed.
- [x] Password reset workflow completed.
- [x] Account disable workflow completed.
- [x] Account enable workflow completed.
- [x] Lockout test completed from Windows 11 client.
- [x] Locked account verified in ADUC.
- [x] Account unlock completed.
- [x] User state verified with PowerShell.
- [x] Domain password policy verified with PowerShell.
- [x] Screenshots added to the lab documentation.

---

# Key Learning Outcomes

After completing this lab, you can explain and demonstrate how to:

- Review password policy in Group Policy Management.
- Review account lockout policy in Group Policy Management.
- Reset a user password in Active Directory.
- Force a user to change password at next logon.
- Disable and enable a user account.
- Simulate a locked account from a Windows 11 client.
- Unlock an account in Active Directory Users and Computers.
- Verify account status using PowerShell.
- Document account support actions for a Service Desk ticket.

---

## 👤 Author

**Xuan Toan Nguyen**  
IT Support | Service Desk | Desktop Support | System Administration  
Adelaide, South Australia

🥈 Silver Medal — WorldSkills Australia SA Regional Competition 2026, Cloud Computing

- 🔗 LinkedIn: [www.linkedin.com/in/toan-nguyen-it-oz](https://www.linkedin.com/in/toan-nguyen-it-oz)
- 💻 GitHub: [github.com/toannguyenitoz](https://github.com/toannguyenitoz)

---

<p align="center">
  <a href="../08-active-directory-group-management/README.md">⬅ Previous Lab</a> ·
  <a href="../../README.md">🏠 Main README</a> ·
  <a href="../10-home-folder-and-file-share/README.md">Next Lab ➜</a> ·
  <a href="#top">⬆ Back to Top</a>
</p>

<p align="center">
  <strong>#ToanNguyenITOz #ActiveDirectory #WindowsServer #ITSupport #ServiceDesk #PowerShell #SystemAdministration</strong>
</p>
