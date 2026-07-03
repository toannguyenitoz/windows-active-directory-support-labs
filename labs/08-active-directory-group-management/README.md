<a id="top"></a>

# 👥 Lab 08 — Active Directory Group Management

<p align="center">
  <img src="https://img.shields.io/badge/Active%20Directory-Groups-6A1B9A" alt="Active Directory Group Management">
  <img src="https://img.shields.io/badge/PowerShell-Automation-5391FE?logo=powershell&logoColor=white" alt="PowerShell Automation">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-2E7D32" alt="Guide">
  <img src="https://img.shields.io/badge/Level-Intermediate-F9A825" alt="Intermediate">
</p>

<p align="center"><a href="../07-active-directory-user-management/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../09-password-lockout-logon-controls/README.md">Next Lab ➜</a></p>

---

## 🎯 Lab Mission

Create and manage Active Directory groups for cleaner user access management.

This lab can be completed in two ways:

1. **GUI method** — manually create groups and memberships using **Active Directory Users and Computers (ADUC)**.
2. **PowerShell method** — create, verify and manage groups using scripts.

> [!NOTE]
> Screenshots show final results and verification evidence. The GUI text explains the complete manual process for creating groups, setting group type/scope and adding members.

---

## ✅ What You Will Learn

- Create Global Security groups.
- Create Domain Local Security access groups.
- Create Distribution groups.
- Add users to role-based groups.
- Nest Global groups inside Domain Local groups.
- Review membership in ADUC.
- Verify group configuration with PowerShell.
- Practise common group membership support tasks.

---

## 🧱 Lab Values

| Item | Value |
|---|---|
| Domain | `W2K16AD.local` |
| Domain Controller | `SRV-DC01` |
| Company OU | `AdelaideTechSolutions` |
| Security Groups OU | `AdelaideTechSolutions > Groups > SecurityGroups` |
| Distribution Groups OU | `AdelaideTechSolutions > Groups > DistributionGroups` |
| Main user group | `GG_All_StandardUsers` |
| IT support group | `GG_IT_Support` |
| Read access group | `DL_SharedData_Read` |
| Modify access group | `DL_SharedData_Modify` |

---

## 🧠 Naming Standard Used

| Prefix | Meaning | Example |
|---|---|---|
| `GG_` | Global Group, usually contains users | `GG_IT_Support` |
| `DL_` | Domain Local Group, usually assigned permissions | `DL_SharedData_Read` |
| `DG_` | Distribution Group, used for email-style grouping examples | `DG_AllStaff` |

> [!TIP]
> This lab follows a simple AGDLP-style idea: users go into Global groups, Global groups go into Domain Local groups, and Domain Local groups are later used for permissions.

---

## 👥 Groups Created in This Lab

| Group | Scope | Category | Purpose |
|---|---|---|---|
| `GG_All_StandardUsers` | Global | Security | Holds all standard users |
| `GG_IT_Support` | Global | Security | Holds IT support users |
| `GG_HR_Users` | Global | Security | Holds HR users |
| `GG_Finance_Users` | Global | Security | Holds Finance users |
| `GG_Sales_Users` | Global | Security | Holds Sales users |
| `GG_Helpdesk_Admins` | Global | Security | Holds helpdesk admin users |
| `DL_SharedData_Read` | Domain Local | Security | Used later for shared folder read access |
| `DL_SharedData_Modify` | Domain Local | Security | Used later for shared folder modify access |
| `DG_AllStaff` | Global | Distribution | All staff distribution example |
| `DG_ITTeam` | Global | Distribution | IT team distribution example |

---

## 🧩 Before You Start

- Complete **Lab 06 — Active Directory OU Structure**.
- Complete **Lab 07 — Active Directory User Management**.
- Confirm these OUs exist:

```text
AdelaideTechSolutions > Groups > SecurityGroups
AdelaideTechSolutions > Groups > DistributionGroups
```

- Confirm Lab 07 users exist:

```text
john.smith
mary.johnson
david.lee
sarah.brown
admin.helpdesk
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
| [`create-lab08-ad-groups.ps1`](../../scripts/create-lab08-ad-groups.ps1) | Creates or updates Lab 08 groups and memberships. |
| [`verify-lab08-ad-groups.ps1`](../../scripts/verify-lab08-ad-groups.ps1) | Verifies groups, scope, category, OU location and key memberships. |
| [`manage-lab08-group-membership.ps1`](../../scripts/manage-lab08-group-membership.ps1) | Demonstrates show, add and remove group membership actions. |

> [!TIP]
> The examples below avoid fixed local drive paths. They assume you are already in the repository root folder. This makes the guide portable on any drive or computer.

---

# Method 1 — Detailed GUI Step-by-Step Guide

Use this method to practise manual group creation and membership management in ADUC. Screenshots are final result evidence; the steps explain the full manual process.

---

## 🖱️ Step 1 — Open the SecurityGroups OU

1. Sign in to `SRV-DC01`.
2. Open **Server Manager**.
3. Click **Tools**.
4. Open **Active Directory Users and Computers**.
5. Expand:

```text
W2K16AD.local > AdelaideTechSolutions > Groups > SecurityGroups
```

6. Confirm this is the correct OU for security groups before creating any groups.

![Open SecurityGroups OU](../../assets/images/lab-08-active-directory-group-management/01-open-security-groups-ou.png)

---

## 🛡️ Step 2 — Create security groups manually

Create the security groups inside:

```text
AdelaideTechSolutions > Groups > SecurityGroups
```

For each group:

1. Right-click `SecurityGroups`.
2. Select:

```text
New > Group
```

3. Enter the **Group name**.
4. Confirm the **Group name (pre-Windows 2000)** is automatically populated.
5. Select the correct **Group scope**.
6. Select **Security** as the group type.
7. Click **OK**.
8. After the group is created, right-click the group and select **Properties**.
9. On the **General** tab, enter a clear description.
10. Click **Apply** and **OK**.

Create these groups:

| Group name | Group scope | Group type | Description |
|---|---|---|---|
| `GG_All_StandardUsers` | Global | Security | Lab 08 global security group for all standard users |
| `GG_IT_Support` | Global | Security | Lab 08 global security group for IT support users |
| `GG_HR_Users` | Global | Security | Lab 08 global security group for HR users |
| `GG_Finance_Users` | Global | Security | Lab 08 global security group for Finance users |
| `GG_Sales_Users` | Global | Security | Lab 08 global security group for Sales users |
| `GG_Helpdesk_Admins` | Global | Security | Lab 08 global security group for Helpdesk admin users |
| `DL_SharedData_Read` | Domain Local | Security | Lab 08 domain local group for read access to SharedData |
| `DL_SharedData_Modify` | Domain Local | Security | Lab 08 domain local group for modify access to SharedData |

Expected result in ADUC:

```text
GG_All_StandardUsers
GG_IT_Support
GG_HR_Users
GG_Finance_Users
GG_Sales_Users
GG_Helpdesk_Admins
DL_SharedData_Read
DL_SharedData_Modify
```

![Security groups created](../../assets/images/lab-08-active-directory-group-management/02-security-groups-created.png)

> [!TIP]
> Use Global groups to collect users by role or department. Use Domain Local groups for permissions on resources such as shared folders.

---

## 📧 Step 3 — Create distribution groups manually

Create the distribution groups inside:

```text
AdelaideTechSolutions > Groups > DistributionGroups
```

For each distribution group:

1. Browse to:

```text
W2K16AD.local > AdelaideTechSolutions > Groups > DistributionGroups
```

2. Right-click `DistributionGroups`.
3. Select:

```text
New > Group
```

4. Enter the group name.
5. Select **Global** for group scope.
6. Select **Distribution** for group type.
7. Click **OK**.
8. Open **Properties** and enter a description.

Create these groups:

| Group name | Group scope | Group type | Description |
|---|---|---|---|
| `DG_AllStaff` | Global | Distribution | Lab 08 distribution group for all staff |
| `DG_ITTeam` | Global | Distribution | Lab 08 distribution group for IT team members |

Expected result:

```text
DG_AllStaff
DG_ITTeam
```

![Distribution groups created](../../assets/images/lab-08-active-directory-group-management/03-distribution-groups-created.png)

> [!NOTE]
> In this lab, distribution groups are created for structure and learning. A real email-enabled distribution group usually requires Exchange or Microsoft 365 integration.

---

## 👤 Step 4 — Add users to Global Security groups

Add users from Lab 07 into the Global Security groups.

For each group:

1. Browse to:

```text
W2K16AD.local > AdelaideTechSolutions > Groups > SecurityGroups
```

2. Right-click the target group.
3. Select **Properties**.
4. Open the **Members** tab.
5. Click **Add**.
6. Enter the username or display name.
7. Click **Check Names**.
8. Confirm the name resolves successfully.
9. Click **OK**.
10. Repeat until all required members are added.
11. Click **Apply** and **OK**.

Add these memberships:

| Group | Members |
|---|---|
| `GG_All_StandardUsers` | `John Smith`, `Mary Johnson`, `David Lee`, `Sarah Brown` |
| `GG_IT_Support` | `John Smith` |
| `GG_HR_Users` | `Mary Johnson` |
| `GG_Finance_Users` | `David Lee` |
| `GG_Sales_Users` | `Sarah Brown` |
| `GG_Helpdesk_Admins` | `Helpdesk Admin` |

For the screenshot, open:

```text
GG_All_StandardUsers > Properties > Members
```

Confirm:

```text
John Smith
Mary Johnson
David Lee
Sarah Brown
```

![Global group members](../../assets/images/lab-08-active-directory-group-management/04-global-group-members.png)

---

## 🔁 Step 5 — Nest Global groups into Domain Local groups

Create nested membership for the access groups.

1. Browse to:

```text
W2K16AD.local > AdelaideTechSolutions > Groups > SecurityGroups
```

2. Right-click:

```text
DL_SharedData_Read
```

3. Select **Properties**.
4. Open the **Members** tab.
5. Click **Add**.
6. Enter:

```text
GG_All_StandardUsers
```

7. Click **Check Names**.
8. Click **OK**.
9. Click **Apply** and **OK**.

Then configure the modify access group:

1. Right-click:

```text
DL_SharedData_Modify
```

2. Select **Properties**.
3. Open the **Members** tab.
4. Click **Add**.
5. Add these groups:

```text
GG_IT_Support
GG_Helpdesk_Admins
```

6. Click **Check Names**.
7. Click **OK**.
8. Click **Apply** and **OK**.

For the screenshot, open:

```text
DL_SharedData_Modify > Properties > Members
```

Confirm:

```text
GG_IT_Support
GG_Helpdesk_Admins
```

![Domain local group nesting](../../assets/images/lab-08-active-directory-group-management/05-domain-local-group-nesting.png)

> [!TIP]
> This demonstrates the AGDLP-style model: user accounts are placed into Global groups, then Global groups are placed into Domain Local groups that can later be used for permissions.

---

## 👥 Step 6 — Add users to distribution groups

Add users to the distribution groups for organisation-style grouping.

1. Browse to:

```text
W2K16AD.local > AdelaideTechSolutions > Groups > DistributionGroups
```

2. Right-click `DG_AllStaff`.
3. Select **Properties**.
4. Open the **Members** tab.
5. Add:

```text
John Smith
Mary Johnson
David Lee
Sarah Brown
```

6. Click **Apply** and **OK**.
7. Right-click `DG_ITTeam`.
8. Select **Properties**.
9. Open the **Members** tab.
10. Add:

```text
John Smith
Helpdesk Admin
```

11. Click **Apply** and **OK**.

---

## 🧾 Step 7 — Review a user's Member Of tab

Review the user side of group membership.

1. Browse to:

```text
W2K16AD.local > AdelaideTechSolutions > Users > StandardUsers
```

2. Right-click `John Smith`.
3. Select **Properties**.
4. Open the **Member Of** tab.
5. Confirm memberships such as:

```text
GG_All_StandardUsers
GG_IT_Support
DG_AllStaff
DG_ITTeam
Domain Users
```

6. Click **OK** or **Cancel** after reviewing.

![User Member Of groups](../../assets/images/lab-08-active-directory-group-management/06-user-member-of-groups.png)

---

## 🧪 Step 8 — Verify groups with PowerShell

Open **PowerShell as Administrator** on `SRV-DC01`.

From the repository root folder, run:

```powershell
Set-Location .\scripts
.\verify-lab08-ad-groups.ps1
```

Expected result:

```text
PASS
```

for group and membership checks.

![Verify groups with PowerShell](../../assets/images/lab-08-active-directory-group-management/07-verify-groups-powershell.png)

---

## 📋 Step 9 — Optional PowerShell group list

Run:

```powershell
Get-ADGroup -Filter * -SearchBase "OU=Groups,OU=AdelaideTechSolutions,DC=W2K16AD,DC=local" -Properties GroupScope,GroupCategory,Description |
Select-Object Name,GroupScope,GroupCategory,Description |
Sort-Object Name |
Format-Table -AutoSize
```

![List groups with PowerShell](../../assets/images/lab-08-active-directory-group-management/08-list-groups-powershell.png)

---

# Method 2 — Recommended Script Workflow

Use this method if you want to complete the lab faster and demonstrate automation skills.

## ⚙️ Script Step 1 — Create groups and memberships

Run on `SRV-DC01` from the repository root folder:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope Process
Set-Location .\scripts
.\create-lab08-ad-groups.ps1
```

---

## 🔍 Script Step 2 — Verify groups and memberships

Run from the `scripts` folder:

```powershell
.\verify-lab08-ad-groups.ps1
```

---

## 🔐 Script Step 3 — Optional group membership management examples

Show group members:

```powershell
.\manage-lab08-group-membership.ps1 -Action ShowGroup -GroupName GG_All_StandardUsers
```

Show a user's groups:

```powershell
.\manage-lab08-group-membership.ps1 -Action ShowUser -MemberName john.smith
```

Add a member:

```powershell
.\manage-lab08-group-membership.ps1 -Action AddMember -GroupName GG_IT_Support -MemberName john.smith
```

Remove a member:

```powershell
.\manage-lab08-group-membership.ps1 -Action RemoveMember -GroupName GG_IT_Support -MemberName john.smith
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

### User not found

Run the Lab 07 user creation script first from the `scripts` folder:

```powershell
.\create-lab07-ad-users.ps1
```

### Group already exists

This is not an error. The script updates existing group descriptions and skips duplicate membership.

### Access is denied

Use a domain administrator account or an account delegated to manage groups and group membership.

---

## 🧾 Command Reference

| Command | Run on | Purpose | Expected result |
|---|---|---|---|
| `New-ADGroup` | Server | Creates AD groups | Groups appear in ADUC |
| `Set-ADGroup` | Server | Updates group attributes | Description updated |
| `Add-ADGroupMember` | Server | Adds users or groups to groups | Membership appears in ADUC |
| `Remove-ADGroupMember` | Server | Removes group members | Membership removed |
| `Get-ADGroup` | Server | Lists group details | Group details returned |
| `Get-ADGroupMember` | Server | Lists group members | Users or nested groups shown |
| `Get-ADPrincipalGroupMembership` | Server | Shows user group membership | User memberships shown |
| `create-lab08-ad-groups.ps1` | Server | Creates groups and memberships | Groups created in correct OUs |
| `verify-lab08-ad-groups.ps1` | Server | Verifies groups and memberships | PASS for expected checks |
| `manage-lab08-group-membership.ps1` | Server | Performs membership support actions | Membership changes as expected |

---

## ✅ Completion Checklist

- [ ] Lab 06 OU structure completed.
- [ ] Lab 07 users created.
- [ ] Security groups created with correct scope and type.
- [ ] Distribution groups created with correct scope and type.
- [ ] Users added to Global groups.
- [ ] Global groups nested into Domain Local groups.
- [ ] Distribution group membership configured.
- [ ] Group membership reviewed in ADUC.
- [ ] User membership reviewed in ADUC.
- [ ] Groups and memberships verified with PowerShell.
- [ ] Optional membership management script tested.

---

## 🧠 Key Takeaways

| Key point | Why it matters |
|---|---|
| 1 | Groups make permission management easier and more scalable. |
| 2 | Naming standards help support staff understand group purpose. |
| 3 | Global groups are useful for grouping users by role or department. |
| 4 | Domain Local groups are useful for assigning access permissions. |
| 5 | PowerShell makes group creation and membership management repeatable. |

---

## 👤 Author

**Xuan Toan Nguyen**  
IT Support | Service Desk | Desktop Support | System Administration  
Adelaide, South Australia

- 🔗 LinkedIn: [www.linkedin.com/in/toan-nguyen-it-oz](https://www.linkedin.com/in/toan-nguyen-it-oz)
- 💻 GitHub: [github.com/toannguyenitoz](https://github.com/toannguyenitoz)

---

<p align="center"><a href="../07-active-directory-user-management/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../09-password-lockout-logon-controls/README.md">Next Lab ➜</a> · <a href="#top">⬆ Back to Top</a></p>
