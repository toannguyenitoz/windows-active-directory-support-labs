<a id="top"></a>

# 🧩 Lab 12 — Group Policy Management & User Environment Control

<p align="center">
  <img src="https://img.shields.io/badge/Windows%20Server-Group%20Policy-5E5E5E?logo=windows&logoColor=white" alt="Windows Server Group Policy">
  <img src="https://img.shields.io/badge/Windows%2011-Client%20Policy-0078D4?logo=windows&logoColor=white" alt="Windows 11 Client Policy">
  <img src="https://img.shields.io/badge/GPMC-GPO%20Management-6A1B9A" alt="Group Policy Management Console">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Environment-2E7D32" alt="IT Support User Environment">
  <img src="https://img.shields.io/badge/Level-Intermediate-F9A825" alt="Intermediate">
  <img src="https://img.shields.io/badge/Images-To%20Be%20Added-FF8F00" alt="Images to be added">
</p>

<p align="center">
  <strong>Step-by-step Group Policy lab for controlling a standard user's Windows environment from Active Directory.</strong>
</p>

<p align="center">
  <a href="../11-rsat-remote-administration/README.md">⬅ Previous Lab</a> ·
  <a href="../../README.md">🏠 Main README</a> ·
  <a href="../13-print-server-and-network-printer/README.md">Next Lab ➜</a>
</p>

---

## 🎯 Lab Mission

This lab demonstrates how an IT Support, Desktop Support or junior System Administrator can use **Group Policy Management** to control a standard user's Windows environment in an Active Directory domain.

Instead of creating another client and repeating the domain join process, this lab focuses on a more realistic workplace task:

```text
A standard user needs a consistent Windows environment after signing in.
IT needs to map the shared data drive, add a desktop shortcut and apply a simple user restriction using Group Policy.
```

In this lab, you will create and link a user-focused GPO to the `StandardUsers` OU, configure several common user environment settings, then verify the policy from a Windows 11 domain client.

---

## 🧠 Why This Lab Matters in the Real World

Group Policy is commonly used in business environments to standardise user settings and reduce manual support work.

Typical Service Desk and Desktop Support use cases include:

- Mapping shared drives for users automatically
- Creating standard desktop shortcuts
- Applying user restrictions
- Controlling Control Panel or Settings access
- Applying department-specific settings through OUs
- Troubleshooting why a policy did not apply
- Using `gpupdate` and `gpresult` to verify policy application

This lab is more valuable than simply joining a second client because it demonstrates **centralised user environment management**.

---

## 🧱 Lab Environment

| Component | Value |
|---|---|
| Domain | `W2K16AD.local` |
| NetBIOS name | `W2K16AD` |
| Domain Controller | `SRV-DC01` |
| Admin workstation | `W11-CLIENT01` |
| Client IP | `192.168.20.101` |
| Server IP | `192.168.20.10` |
| Root OU | `AdelaideTechSolutions` |
| Target user OU | `AdelaideTechSolutions > Users > StandardUsers` |
| Test user | Any standard lab user in `StandardUsers`, for example `john.smith` |
| Shared folder from Lab 10 | `\\SRV-DC01\SharedData` |
| Drive letter to map | `S:` |
| GPO name | `GPO-StandardUsers-Environment` |
| Main GUI tool | Group Policy Management Console |
| GPMC command | `gpmc.msc` |

---

## 📸 Screenshot Folder

Copy screenshots for this lab into:

```text
assets/images/lab-12-group-policy-management-user-environment-control/
```

> [!NOTE]
> The README already contains the image references. Screenshots can be copied into the image folder later using the exact filenames listed in the Visual Evidence Checklist.

---

## ✅ Skills Demonstrated

| Area | Skills |
|---|---|
| Group Policy Management | Open GPMC, create a GPO, link it to an OU |
| User Environment Control | Map a network drive and create a desktop shortcut |
| Security & Restrictions | Apply a simple user restriction through Administrative Templates |
| Active Directory Structure | Target users through OU location |
| Windows Client Support | Force policy refresh and test the user experience |
| Troubleshooting | Use `gpupdate`, `gpresult` and GPMC settings review |
| Documentation | Capture evidence and write a Service Desk-style case note |

---

## 🧩 Before You Start

Complete these earlier labs first:

| Required lab | Why it is needed |
|---|---|
| Lab 04 — Active Directory Domain Services Setup | Domain Controller is available |
| Lab 05 — Join Windows 11 Client to Domain | Client can sign in with domain users |
| Lab 06 — Active Directory OU Structure | `AdelaideTechSolutions` OU structure exists |
| Lab 07 — Active Directory User Management | Standard test user exists |
| Lab 10 — Home Folder and File Share | `\\SRV-DC01\SharedData` share exists |
| Lab 11 — RSAT Remote Administration | Admin workstation workflow is ready |

Confirm these requirements:

- `SRV-DC01` is running.
- `W11-CLIENT01` is joined to `W2K16AD.local`.
- A test standard user exists in:

```text
AdelaideTechSolutions > Users > StandardUsers
```

- The share below exists and is reachable from the client:

```text
\\SRV-DC01\SharedData
```

- You have a domain admin or approved admin account to create and edit GPOs.

> [!WARNING]
> Use a lab environment only. Do not publish real passwords, personal information, client data or internal business details.

---

# Design Decision for This Lab

## What This Lab Does

This lab applies **User Configuration** settings to users in the `StandardUsers` OU.

The GPO will configure:

| Setting | Type | Purpose |
|---|---|---|
| Shared drive mapping | Group Policy Preference | Automatically maps `S:` to `\\SRV-DC01\SharedData` |
| Desktop shortcut | Group Policy Preference | Adds a shortcut to the shared data location |
| Control Panel restriction | Administrative Template | Demonstrates a visible user restriction |

## What This Lab Does Not Do

This lab does **not** focus on joining another client to the domain.

That task was already covered in Lab 05. Lab 12 focuses on what happens **after** the domain environment exists: controlling the user experience centrally with Group Policy.

---

# GUI User Guide

Follow the steps in order.

---

## Step 01 — Open Group Policy Management Console

### Purpose

Open the Group Policy Management Console from the admin workstation or server. This tool is used to create, link and manage GPOs.

### Steps

1. Sign in to `W11-CLIENT01` using a domain admin or approved admin account.
2. Press:

```text
Win + R
```

3. Enter:

```text
gpmc.msc
```

4. Press **Enter**.

### If GPMC Does Not Open on Windows 11

The Group Policy Management tool may not be installed on the Windows 11 client.

Open **PowerShell as Administrator** and check:

```powershell
Get-WindowsCapability -Name RSAT.GroupPolicy* -Online
```

If it is not installed, install it:

```powershell
Add-WindowsCapability -Online -Name Rsat.GroupPolicy.Management.Tools~~~~0.0.1.0
```

Then try again:

```text
gpmc.msc
```

### If the Client Has No Internet

If RSAT Group Policy tools cannot install because the client has no Internet access:

1. Temporarily change the `W11-CLIENT01` VM network adapter to **NAT**.
2. Renew the IP configuration:

```cmd
ipconfig /renew
```

3. Test Internet access:

```powershell
Test-NetConnection www.microsoft.com -Port 443
```

4. Install the Group Policy RSAT tool.
5. Change the network adapter back to the lab/domain network.
6. Refresh DNS and IP:

```cmd
ipconfig /flushdns
ipconfig /renew
ping SRV-DC01
nslookup SRV-DC01
```

### Expected Result

The **Group Policy Management** window opens and shows:

```text
Forest: W2K16AD.local
Domains
W2K16AD.local
```

### Visual Reference

![Open Group Policy Management](../../assets/images/lab-12-group-policy-management-user-environment-control/01-open-group-policy-management.png)

<p align="right"><a href="#top">⬆ Back to Top</a></p>

---

## Step 02 — Create a New GPO for Standard Users

### Purpose

Create a new Group Policy Object that will control the standard user environment.

### Steps

1. In **Group Policy Management**, expand:

```text
Forest: W2K16AD.local
└── Domains
    └── W2K16AD.local
```

2. Browse to the target OU:

```text
AdelaideTechSolutions
└── Users
    └── StandardUsers
```

3. Right-click **StandardUsers**.
4. Select:

```text
Create a GPO in this domain, and Link it here...
```

5. Name the new GPO:

```text
GPO-StandardUsers-Environment
```

6. Select **OK**.

### Expected Result

A new GPO named `GPO-StandardUsers-Environment` is created and linked to the `StandardUsers` OU.

### Visual Reference

![Create StandardUsers GPO](../../assets/images/lab-12-group-policy-management-user-environment-control/02-create-standardusers-gpo.png)

<p align="right"><a href="#top">⬆ Back to Top</a></p>

---

## Step 03 — Confirm the GPO Link and Scope

### Purpose

Confirm that the GPO is linked to the correct OU before configuring settings.

### Steps

1. Select the `StandardUsers` OU in GPMC.
2. Check the **Linked Group Policy Objects** tab.
3. Confirm this GPO appears:

```text
GPO-StandardUsers-Environment
```

4. Select the GPO and review the **Scope** tab.
5. Confirm the link location is the `StandardUsers` OU.

### Expected Result

The GPO is linked to:

```text
AdelaideTechSolutions > Users > StandardUsers
```

This means the GPO targets users located in this OU.

### Visual Reference

![Link GPO to StandardUsers OU](../../assets/images/lab-12-group-policy-management-user-environment-control/03-link-gpo-to-standardusers-ou.png)

<p align="right"><a href="#top">⬆ Back to Top</a></p>

---

## Step 04 — Edit the GPO and Open User Configuration

### Purpose

Open the GPO editor and navigate to user-based settings.

### Steps

1. In GPMC, right-click:

```text
GPO-StandardUsers-Environment
```

2. Select:

```text
Edit...
```

3. In the Group Policy Management Editor, expand:

```text
User Configuration
```

This lab uses **User Configuration** because the settings should follow the user after sign-in.

### Expected Result

The Group Policy Management Editor is open and ready to configure user environment settings.

### Visual Reference

![Edit GPO User Configuration](../../assets/images/lab-12-group-policy-management-user-environment-control/04-edit-gpo-user-configuration.png)

<p align="right"><a href="#top">⬆ Back to Top</a></p>

---

## Step 05 — Configure a Mapped Drive to SharedData

### Purpose

Automatically map a shared network folder for standard users.

This is a very common workplace Group Policy task. Instead of manually mapping a drive for each user, the drive is mapped centrally through Group Policy.

### Steps

1. In Group Policy Management Editor, browse to:

```text
User Configuration
└── Preferences
    └── Windows Settings
        └── Drive Maps
```

2. Right-click **Drive Maps**.
3. Select:

```text
New > Mapped Drive
```

4. Configure the mapped drive:

| Field | Value |
|---|---|
| Action | `Update` |
| Location | `\\SRV-DC01\SharedData` |
| Reconnect | Enabled |
| Label as | `SharedData` |
| Drive Letter | `S:` |

5. Open the **Common** tab.
6. Recommended lab options:

| Option | Recommended setting |
|---|---|
| Run in logged-on user's security context | Enabled |
| Remove this item when it is no longer applied | Enabled |

7. Select **OK**.

### Expected Result

The drive map policy is created and will map:

```text
S: -> \\SRV-DC01\SharedData
```

for users in the `StandardUsers` OU.

### Visual Reference

![Configure Drive Map SharedData](../../assets/images/lab-12-group-policy-management-user-environment-control/05-configure-drive-map-shareddata.png)

<p align="right"><a href="#top">⬆ Back to Top</a></p>

---

## Step 06 — Configure a Desktop Shortcut to SharedData

### Purpose

Create a standard desktop shortcut for users so they can easily access the shared folder.

### Steps

1. In Group Policy Management Editor, browse to:

```text
User Configuration
└── Preferences
    └── Windows Settings
        └── Shortcuts
```

2. Right-click **Shortcuts**.
3. Select:

```text
New > Shortcut
```

4. Configure the shortcut:

| Field | Value |
|---|---|
| Action | `Update` |
| Name | `Company SharedData` |
| Target type | `File System Object` |
| Location | `Desktop` |
| Target path | `\\SRV-DC01\SharedData` |

5. Open the **Common** tab.
6. Recommended lab options:

| Option | Recommended setting |
|---|---|
| Run in logged-on user's security context | Enabled |
| Remove this item when it is no longer applied | Enabled |

7. Select **OK**.

### Expected Result

A shortcut named `Company SharedData` will be created on the desktop for users in the `StandardUsers` OU.

### Visual Reference

![Configure Desktop Shortcut](../../assets/images/lab-12-group-policy-management-user-environment-control/06-configure-desktop-shortcut.png)

<p align="right"><a href="#top">⬆ Back to Top</a></p>

---

## Step 07 — Configure a Simple Control Panel Restriction

### Purpose

Configure a visible user restriction so the policy effect can be clearly tested.

This lab uses a simple Control Panel restriction because it is easy to verify from the client.

> [!IMPORTANT]
> This setting is for lab demonstration. In a real workplace, apply restrictions only after approval and testing.

### Steps

1. In Group Policy Management Editor, browse to:

```text
User Configuration
└── Policies
    └── Administrative Templates
        └── Control Panel
```

2. Open:

```text
Prohibit access to Control Panel and PC settings
```

3. Set it to:

```text
Enabled
```

4. Select **Apply**.
5. Select **OK**.

### Expected Result

Users affected by the GPO should be blocked from opening Control Panel and Windows Settings after the policy applies.

### Visual Reference

![Configure Control Panel Restriction](../../assets/images/lab-12-group-policy-management-user-environment-control/07-configure-control-panel-restriction.png)

<p align="right"><a href="#top">⬆ Back to Top</a></p>

---

## Step 08 — Review the GPO Settings Summary

### Purpose

Review the GPO before testing on the client. This is good documentation practice and helps confirm that the correct settings were configured.

### Steps

1. Close the Group Policy Management Editor.
2. In GPMC, select:

```text
GPO-StandardUsers-Environment
```

3. Select the **Settings** tab.
4. Review the configured settings:

| Area | Expected setting |
|---|---|
| Drive Maps | `S:` mapped to `\\SRV-DC01\SharedData` |
| Shortcuts | `Company SharedData` shortcut on Desktop |
| Control Panel | Prohibit access to Control Panel and PC settings enabled |

### Expected Result

The GPO settings summary shows the configured user environment controls.

### Visual Reference

![GPO Settings Summary](../../assets/images/lab-12-group-policy-management-user-environment-control/08-gpo-settings-summary.png)

<p align="right"><a href="#top">⬆ Back to Top</a></p>

---

## Step 09 — Sign In as a Standard User and Run gpupdate

### Purpose

Force a policy refresh on the Windows 11 client and test the policy using a standard domain user.

### Steps

1. On `W11-CLIENT01`, sign out of the admin account.
2. Sign in using a standard user located in:

```text
AdelaideTechSolutions > Users > StandardUsers
```

Example:

```text
W2K16AD\john.smith
```

3. Open **Command Prompt**.
4. Run:

```cmd
gpupdate /force
```

5. If Windows asks to sign out or restart, sign out and sign back in.

### Expected Result

The command completes successfully:

```text
Computer Policy update has completed successfully.
User Policy update has completed successfully.
```

> [!TIP]
> Drive maps and shortcuts often apply after sign out/sign in. If the result does not appear immediately, sign out and sign back in as the standard user.

### Visual Reference

![gpupdate on Client](../../assets/images/lab-12-group-policy-management-user-environment-control/09-gpupdate-on-client.png)

<p align="right"><a href="#top">⬆ Back to Top</a></p>

---

## Step 10 — Verify the Applied GPO with gpresult

### Purpose

Use `gpresult` to confirm the GPO applied to the signed-in user.

### Steps

1. While signed in as the standard user, open **Command Prompt**.
2. Run:

```cmd
gpresult /r
```

3. Review the **User Settings** section.
4. Look for:

```text
Applied Group Policy Objects
```

5. Confirm this GPO appears:

```text
GPO-StandardUsers-Environment
```

### Optional HTML Report

If you want a more detailed report, run:

```cmd
gpresult /h C:\Temp\gpresult-lab12.html
```

Then open the HTML report in a browser.

### Expected Result

`GPO-StandardUsers-Environment` appears under the applied user policy objects.

### Visual Reference

![gpresult Applied GPO](../../assets/images/lab-12-group-policy-management-user-environment-control/10-gpresult-applied-gpo.png)

<p align="right"><a href="#top">⬆ Back to Top</a></p>

---

## Step 11 — Verify the Mapped Drive and Desktop Shortcut

### Purpose

Confirm that the Group Policy Preferences applied successfully.

### Steps

1. Open **File Explorer**.
2. Select **This PC**.
3. Confirm the mapped drive appears:

```text
SharedData (S:)
```

4. Open the mapped drive and confirm it points to:

```text
\\SRV-DC01\SharedData
```

5. Check the user desktop.
6. Confirm the shortcut appears:

```text
Company SharedData
```

### Expected Result

The standard user has:

- `S:` mapped to `\\SRV-DC01\SharedData`
- `Company SharedData` shortcut on the desktop

### Visual Reference

![Verify Mapped Drive and Shortcut](../../assets/images/lab-12-group-policy-management-user-environment-control/11-verify-mapped-drive-and-shortcut.png)

<p align="right"><a href="#top">⬆ Back to Top</a></p>

---

## Step 12 — Test the Control Panel Restriction

### Purpose

Confirm the Administrative Template policy applied to the standard user.

### Steps

1. While signed in as the standard user, try to open **Settings** or **Control Panel**.
2. You can test using Run:

```text
Win + R
```

3. Enter:

```text
control
```

4. Press **Enter**.

### Expected Result

Windows blocks the user from opening Control Panel or Settings because the GPO restriction is enabled.

### Visual Reference

![Control Panel Restriction Test](../../assets/images/lab-12-group-policy-management-user-environment-control/12-control-panel-restriction-test.png)

<p align="right"><a href="#top">⬆ Back to Top</a></p>

---

# Visual Evidence Checklist

Copy the screenshots into:

```text
assets/images/lab-12-group-policy-management-user-environment-control/
```

Use these exact filenames:

| No. | File | Evidence |
|---:|---|---|
| 01 | `01-open-group-policy-management.png` | GPMC opened and connected to `W2K16AD.local` |
| 02 | `02-create-standardusers-gpo.png` | New GPO created for StandardUsers |
| 03 | `03-link-gpo-to-standardusers-ou.png` | GPO linked to the StandardUsers OU |
| 04 | `04-edit-gpo-user-configuration.png` | GPO editor opened under User Configuration |
| 05 | `05-configure-drive-map-shareddata.png` | Drive map configured for `S:` to `\\SRV-DC01\SharedData` |
| 06 | `06-configure-desktop-shortcut.png` | Desktop shortcut configured for `Company SharedData` |
| 07 | `07-configure-control-panel-restriction.png` | Control Panel restriction enabled |
| 08 | `08-gpo-settings-summary.png` | GPO settings reviewed in GPMC |
| 09 | `09-gpupdate-on-client.png` | `gpupdate /force` run on Windows 11 client |
| 10 | `10-gpresult-applied-gpo.png` | `gpresult /r` confirms the GPO applied |
| 11 | `11-verify-mapped-drive-and-shortcut.png` | Mapped drive and desktop shortcut verified |
| 12 | `12-control-panel-restriction-test.png` | Control Panel or Settings restriction verified |

---

# Real-World Service Desk Scenario

## Example Ticket

```text
A new group of standard users needs automatic access to the company shared data folder. The desktop should include a shortcut to the shared folder, and standard users should not be able to access Control Panel settings.
```

## Support Workflow

| Step | Action |
|---|---|
| 1 | Confirm the target users are located in the correct AD OU. |
| 2 | Confirm the shared folder exists and users have access. |
| 3 | Create a new GPO for the user environment settings. |
| 4 | Link the GPO to the target user OU. |
| 5 | Configure drive mapping using Group Policy Preferences. |
| 6 | Configure a desktop shortcut using Group Policy Preferences. |
| 7 | Configure a visible user restriction using Administrative Templates. |
| 8 | Sign in as a test user and run `gpupdate /force`. |
| 9 | Verify the applied GPO with `gpresult /r`. |
| 10 | Check the user experience in File Explorer and on the desktop. |
| 11 | Document the result and any issues found. |

## Example Case Note

```text
Created and linked GPO-StandardUsers-Environment to the StandardUsers OU. Configured S: drive mapping to \\SRV-DC01\SharedData, added a Company SharedData desktop shortcut, and enabled a Control Panel restriction for lab testing. Signed in as a standard test user, refreshed policy using gpupdate /force, and verified policy application with gpresult /r. Confirmed mapped drive, desktop shortcut and restriction applied successfully. Ticket resolved.
```

---

# Troubleshooting Guide

## GPO Does Not Apply to the User

Check the user is in the correct OU:

```text
AdelaideTechSolutions > Users > StandardUsers
```

Then run:

```cmd
gpupdate /force
gpresult /r
```

Confirm the GPO appears under:

```text
Applied Group Policy Objects
```

If it does not appear, check:

- The GPO is linked to the correct OU.
- The user account is inside the linked OU.
- The GPO link is enabled.
- User Configuration is enabled on the GPO.
- Security filtering still allows the user to apply the policy.
- The client can resolve the domain and Domain Controller.

---

## GPO Is Linked but Not Applying

In GPMC, check:

1. Select the `StandardUsers` OU.
2. Confirm the GPO link is present.
3. Confirm **Link Enabled** is set to **Yes**.
4. Select the GPO.
5. Confirm **GPO Status** is not set to disable User Configuration.

Useful command:

```cmd
gpresult /r
```

---

## Drive S: Does Not Appear

Check these items:

| Check | What to verify |
|---|---|
| Share path | `\\SRV-DC01\SharedData` is correct |
| DNS | `SRV-DC01` resolves from the client |
| Access permission | The user can access the share manually |
| GPO target | The user is in `StandardUsers` OU |
| Preference settings | Drive map Action is `Update` |
| Sign-in refresh | Sign out and sign back in after `gpupdate /force` |

Manual test from the client:

```cmd
net use S: \\SRV-DC01\SharedData
```

If manual mapping fails, the issue is likely share access, NTFS permission or name resolution rather than Group Policy.

---

## Desktop Shortcut Does Not Appear

Check:

- The shortcut is configured under **User Configuration**, not Computer Configuration.
- The shortcut Location is set to **Desktop**.
- The Target path is correct:

```text
\\SRV-DC01\SharedData
```

- The user signed out and signed back in.

---

## Control Panel Is Still Accessible

Check:

- The setting is configured under:

```text
User Configuration > Policies > Administrative Templates > Control Panel
```

- The setting is set to **Enabled**.
- The user is in the linked OU.
- `gpresult /r` shows the GPO as applied.
- The user signed out and signed back in.

---

## Group Policy Management Console Is Missing

Install the RSAT Group Policy tool:

```powershell
Add-WindowsCapability -Online -Name Rsat.GroupPolicy.Management.Tools~~~~0.0.1.0
```

Then open:

```text
gpmc.msc
```

---

## DNS or Domain Connectivity Issue

Run:

```cmd
ipconfig /all
ping SRV-DC01
nslookup SRV-DC01
```

The DNS server should point to:

```text
192.168.20.10
```

---

# Rollback / Cleanup

Because this lab changes the user experience, it is useful to know how to roll it back.

## Option 1 — Disable the GPO Link

1. Open GPMC.
2. Browse to:

```text
AdelaideTechSolutions > Users > StandardUsers
```

3. Right-click the linked GPO.
4. Untick:

```text
Link Enabled
```

5. On the client, run:

```cmd
gpupdate /force
```

6. Sign out and sign back in.

## Option 2 — Remove Only the Control Panel Restriction

1. Edit `GPO-StandardUsers-Environment`.
2. Browse to:

```text
User Configuration > Policies > Administrative Templates > Control Panel
```

3. Open:

```text
Prohibit access to Control Panel and PC settings
```

4. Set it to:

```text
Not Configured
```

5. Run `gpupdate /force` on the client.
6. Sign out and sign back in.

## Option 3 — Delete the GPO After the Lab

Only do this in a lab environment:

1. Open GPMC.
2. Right-click `GPO-StandardUsers-Environment`.
3. Select **Delete**.
4. Confirm deletion.

> [!TIP]
> Because the Drive Map and Shortcut items were configured with **Remove this item when it is no longer applied**, they should be removed when the GPO no longer applies after policy refresh and sign-in.

---

# Command Reference

| Command | Run on | Purpose |
|---|---|---|
| `gpmc.msc` | Admin workstation or server | Opens Group Policy Management Console |
| `gpupdate /force` | Client | Forces Group Policy refresh |
| `gpresult /r` | Client | Shows applied Group Policy Objects |
| `gpresult /h C:\Temp\gpresult-lab12.html` | Client | Creates an HTML GPO result report |
| `ipconfig /all` | Client | Reviews IP and DNS settings |
| `ping SRV-DC01` | Client | Tests connectivity to Domain Controller |
| `nslookup SRV-DC01` | Client | Tests DNS resolution |
| `net use` | Client | Lists mapped drives |
| `net use S: \\SRV-DC01\SharedData` | Client | Manually tests drive mapping |
| `Get-WindowsCapability -Name RSAT.GroupPolicy* -Online` | Client | Checks GPMC RSAT installation state |
| `Add-WindowsCapability -Online -Name Rsat.GroupPolicy.Management.Tools~~~~0.0.1.0` | Client | Installs Group Policy Management RSAT tools |

---

# PowerShell Reference

These commands are optional but useful for documenting and verifying the lab.

## Check GPOs

Run from a machine with Group Policy PowerShell tools:

```powershell
Get-GPO -All | Select-Object DisplayName,Owner,GpoStatus,CreationTime,ModificationTime
```

## Check One GPO

```powershell
Get-GPO -Name "GPO-StandardUsers-Environment"
```

## Check GPO Inheritance for the StandardUsers OU

```powershell
Get-GPInheritance -Target "OU=StandardUsers,OU=Users,OU=AdelaideTechSolutions,DC=W2K16AD,DC=local"
```

## Create an HTML Group Policy Report

```powershell
Get-GPOReport -Name "GPO-StandardUsers-Environment" -ReportType Html -Path "C:\Temp\GPO-StandardUsers-Environment.html"
```

---

# Completion Checklist

- [ ] Opened Group Policy Management Console.
- [ ] Verified or installed RSAT Group Policy Management tools if needed.
- [ ] Created `GPO-StandardUsers-Environment`.
- [ ] Linked the GPO to `AdelaideTechSolutions > Users > StandardUsers`.
- [ ] Opened the GPO in Group Policy Management Editor.
- [ ] Configured mapped drive `S:` to `\\SRV-DC01\SharedData`.
- [ ] Configured `Company SharedData` desktop shortcut.
- [ ] Enabled Control Panel restriction for lab demonstration.
- [ ] Reviewed the GPO settings summary.
- [ ] Signed in as a standard test user.
- [ ] Ran `gpupdate /force` on the client.
- [ ] Verified the GPO using `gpresult /r`.
- [ ] Confirmed mapped drive appears.
- [ ] Confirmed desktop shortcut appears.
- [ ] Confirmed the Control Panel restriction works.
- [ ] Added screenshots to the lab image folder.
- [ ] Documented the result as a Service Desk-style case note.

---

# Key Learning Outcomes

After completing this lab, you can explain and demonstrate how to:

- Use GPMC to create and manage a Group Policy Object.
- Link a GPO to a specific Active Directory OU.
- Understand the difference between User Configuration and Computer Configuration.
- Use Group Policy Preferences to map a network drive.
- Use Group Policy Preferences to create a desktop shortcut.
- Use Administrative Templates to apply a visible user restriction.
- Force policy refresh using `gpupdate /force`.
- Verify applied policies using `gpresult /r`.
- Troubleshoot common reasons why Group Policy does not apply.
- Roll back or disable a lab GPO safely.

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
  <a href="../11-rsat-remote-administration/README.md">⬅ Previous Lab</a> ·
  <a href="../../README.md">🏠 Main README</a> ·
  <a href="../13-print-server-and-network-printer/README.md">Next Lab ➜</a> ·
  <a href="#top">⬆ Back to Top</a>
</p>

<p align="center">
  <strong>#ToanNguyenITOz #WindowsServer #Windows11 #ActiveDirectory #GroupPolicy #GPO #ITSupport #ServiceDesk #SystemAdministration</strong>
</p>
