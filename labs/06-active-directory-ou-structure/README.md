<a id="top"></a>

# 🗂️ Lab 06 — Active Directory OU Structure

<p align="center">
  <img src="https://img.shields.io/badge/Active%20Directory-OU%20Design-6A1B9A" alt="Active Directory OU Structure">
  <img src="https://img.shields.io/badge/PowerShell-Automation-5391FE?logo=powershell&logoColor=white" alt="PowerShell Automation">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-2E7D32" alt="Guide">
  <img src="https://img.shields.io/badge/Level-Intermediate-F9A825" alt="Intermediate">
</p>

<p align="center"><a href="../05-join-windows-11-client-to-domain/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../07-active-directory-user-management/README.md">Next Lab ➜</a></p>

---

## 🎯 Lab Mission

Create a clean, workplace-style **Organizational Unit (OU)** structure in Active Directory for a small company environment.

This lab can be completed in two ways:

1. **GUI method** — create and manage OUs using **Active Directory Users and Computers (ADUC)**.
2. **PowerShell method** — create, verify and move objects using scripts.

> [!NOTE]
> This lab is written as a practical user guide. Screenshots are used as visual evidence for a GitHub portfolio and can be created after completing the steps by GUI or PowerShell.

---

## ✅ What You Will Learn

- Create a top-level company OU.
- Create structured OUs for users, computers, groups, service accounts and departments.
- Organize sub-OUs for departments, user types, computer types and group types.
- Move a joined Windows 11 client computer object into the correct OU.
- Verify the OU structure using PowerShell.
- Use repeatable scripts for Active Directory administration tasks.

---

## 🧱 Lab Values

| Item | Value |
|---|---|
| Domain | `W2K16AD.local` |
| Domain Controller | `SRV-DC01` |
| Company name | `Adelaide Tech Solutions` |
| Top-level OU | `AdelaideTechSolutions` |
| Client computer | `W11-CLIENT01` |
| Target computer OU | `AdelaideTechSolutions > Computers > Workstations` |

---

## 🗺️ Target OU Structure

```text
W2K16AD.local
└── AdelaideTechSolutions
    ├── Computers
    │   ├── Workstations
    │   ├── Servers
    │   └── Laptops
    ├── Departments
    │   ├── IT
    │   ├── HR
    │   ├── Finance
    │   ├── Sales
    │   └── Operations
    ├── Groups
    │   ├── SecurityGroups
    │   └── DistributionGroups
    ├── ServiceAccounts
    └── Users
        ├── StandardUsers
        ├── AdminUsers
        └── DisabledUsers
```

---

## 🧩 Before You Start

- Complete **Lab 05 — Join Windows 11 Client to Domain**.
- Confirm `W11-CLIENT01` exists in Active Directory.
- Sign in to `SRV-DC01` using a domain administrator account.
- Open PowerShell as Administrator if using scripts.
- Open PowerShell from the repository root folder, or change directory to the repository root before running scripts.

> [!WARNING]
> Use a lab environment only. Do not publish real passwords, personal information, client data or internal business details.

---

## 🧰 Scripts Used in This Lab

| Script | Purpose |
|---|---|
| [`create-lab06-ou-structure.ps1`](../../scripts/create-lab06-ou-structure.ps1) | Creates the full OU structure. |
| [`verify-lab06-ou-structure.ps1`](../../scripts/verify-lab06-ou-structure.ps1) | Verifies all expected OUs exist. |
| [`move-lab06-client-to-workstations-ou.ps1`](../../scripts/move-lab06-client-to-workstations-ou.ps1) | Moves `W11-CLIENT01` into the Workstations OU. |

> [!TIP]
> The examples below avoid fixed local drive paths. They assume you are already in the repository root folder. This makes the guide portable on any drive or computer.

Example:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope Process
Set-Location .\scripts
.\create-lab06-ou-structure.ps1
.\verify-lab06-ou-structure.ps1
.\move-lab06-client-to-workstations-ou.ps1
```

> [!TIP]
> The creation script is idempotent. This means it can be run again without creating duplicate OUs. Existing OUs are detected and skipped.

---

# Method 1 — GUI Step-by-Step Guide

Use this method if you want to practise the normal Active Directory admin interface.

---

## 🖱️ Step 1 — Open Active Directory Users and Computers

On `SRV-DC01`, open:

```text
Server Manager > Tools > Active Directory Users and Computers
```

Click the domain root:

```text
W2K16AD.local
```

You should see the default containers such as `Builtin`, `Computers`, `Domain Controllers` and `Users`.

![Open ADUC domain root](../../assets/images/lab-06-active-directory-ou-structure/01-open-aduc-domain-root.png)

---

## 🏢 Step 2 — Create the top-level company OU

Right-click the domain:

```text
W2K16AD.local > New > Organizational Unit
```

Create this OU:

```text
AdelaideTechSolutions
```

Keep this option selected:

```text
Protect container from accidental deletion
```

![Create company OU](../../assets/images/lab-06-active-directory-ou-structure/02-create-company-ou.png)

> [!TIP]
> The display company name is **Adelaide Tech Solutions**, but the OU is named `AdelaideTechSolutions` to keep it clean for scripts and administration.

---

## 🧱 Step 3 — Create core OUs

Inside `AdelaideTechSolutions`, create these OUs:

```text
Users
Computers
Groups
ServiceAccounts
Departments
```

GUI path:

```text
Right-click AdelaideTechSolutions > New > Organizational Unit
```

![Create core organizational units](../../assets/images/lab-06-active-directory-ou-structure/03-create-core-organizational-units.png)

---

## 🏬 Step 4 — Create department OUs

Inside:

```text
AdelaideTechSolutions > Departments
```

Create these OUs:

```text
IT
HR
Finance
Sales
Operations
```

![Create department OUs](../../assets/images/lab-06-active-directory-ou-structure/04-create-department-ous.png)

---

## 👤 Step 5 — Create user management OUs

Inside:

```text
AdelaideTechSolutions > Users
```

Create these OUs:

```text
StandardUsers
AdminUsers
DisabledUsers
```

![Create user management OUs](../../assets/images/lab-06-active-directory-ou-structure/05-create-user-management-ous.png)

---

## 💻 Step 6 — Create computer management OUs

Inside:

```text
AdelaideTechSolutions > Computers
```

Create these OUs:

```text
Workstations
Servers
Laptops
```

![Create computer management OUs](../../assets/images/lab-06-active-directory-ou-structure/06-create-computer-management-ous.png)

---

## 👥 Step 7 — Create group management OUs

Inside:

```text
AdelaideTechSolutions > Groups
```

Create these OUs:

```text
SecurityGroups
DistributionGroups
```

![Create group management OUs](../../assets/images/lab-06-active-directory-ou-structure/07-create-group-management-ous.png)

---

## 🧾 Step 8 — Review the final OU structure

Expand the `AdelaideTechSolutions` OU and confirm the full structure is visible.

Expected result:

```text
AdelaideTechSolutions
├── Computers
├── Departments
├── Groups
├── ServiceAccounts
└── Users
```

![Final OU structure overview](../../assets/images/lab-06-active-directory-ou-structure/08-final-ou-structure-overview.png)

---

## 🧪 Step 9 — Verify OU structure with PowerShell

Open **PowerShell as Administrator** on `SRV-DC01`.

Run:

```powershell
Get-ADOrganizationalUnit -Filter * -SearchBase "OU=AdelaideTechSolutions,DC=W2K16AD,DC=local" | Select-Object Name,DistinguishedName | Sort-Object Name
```

![Verify OU structure with PowerShell](../../assets/images/lab-06-active-directory-ou-structure/09-verify-ou-structure-powershell.png)

> [!TIP]
> This verifies the structure from the command line and is useful evidence for a portfolio.

---

## 🚚 Step 10 — Move the client computer object

In ADUC, go to the default container:

```text
W2K16AD.local > Computers
```

Right-click:

```text
W11-CLIENT01
```

Select:

```text
Move
```

Move it to:

```text
AdelaideTechSolutions > Computers > Workstations
```

![Move client computer to Workstations OU](../../assets/images/lab-06-active-directory-ou-structure/10-move-client-computer-to-workstations-ou.png)

> [!TIP]
> In real environments, administrators usually move computer objects out of default containers and into managed OUs.

---

## ✅ Step 11 — Verify the computer object location

Open **PowerShell as Administrator** on `SRV-DC01`.

Run:

```powershell
Get-ADComputer W11-CLIENT01 -Properties DistinguishedName | Select-Object Name, DistinguishedName
```

Expected result should include:

```text
OU=Workstations,OU=Computers,OU=AdelaideTechSolutions,DC=W2K16AD,DC=local
```

![Verify client computer OU with PowerShell](../../assets/images/lab-06-active-directory-ou-structure/11-verify-client-computer-ou-powershell.png)

---

# Method 2 — PowerShell Automation Guide

Use this method if you want to complete the lab faster and demonstrate automation skills.

---

## ⚙️ Script Step 1 — Create the full OU structure

Run on `SRV-DC01` from the repository root folder:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope Process
Set-Location .\scripts
.\create-lab06-ou-structure.ps1
```

This script creates:

```text
AdelaideTechSolutions
Users
Computers
Groups
ServiceAccounts
Departments
IT, HR, Finance, Sales, Operations
StandardUsers, AdminUsers, DisabledUsers
Workstations, Servers, Laptops
SecurityGroups, DistributionGroups
```

---

## 🔍 Script Step 2 — Verify the OU structure

Run from the `scripts` folder:

```powershell
.\verify-lab06-ou-structure.ps1
```

Expected result:

```text
PASS
```

for all required OUs.

---

## 🚚 Script Step 3 — Move the client computer object

Run from the `scripts` folder:

```powershell
.\move-lab06-client-to-workstations-ou.ps1
```

This moves:

```text
W11-CLIENT01
```

into:

```text
OU=Workstations,OU=Computers,OU=AdelaideTechSolutions,DC=W2K16AD,DC=local
```

---

## 🧪 Script Step 4 — Verify the client computer location

Run:

```powershell
Get-ADComputer W11-CLIENT01 -Properties DistinguishedName | Select-Object Name, DistinguishedName
```

Expected result:

```text
W11-CLIENT01
OU=Workstations,OU=Computers,OU=AdelaideTechSolutions,DC=W2K16AD,DC=local
```

---

## 🧯 Troubleshooting

### ActiveDirectory module is not found

Run the scripts on the Domain Controller, or install RSAT tools on an admin workstation.

Check module availability:

```powershell
Get-Module -ListAvailable ActiveDirectory
```

### Access is denied

Use a domain administrator account or an account with permission to create OUs and move computer objects.

### Computer object cannot be found

Confirm the Windows 11 client has already joined the domain in Lab 05.

Run:

```powershell
Get-ADComputer W11-CLIENT01
```

### OU already exists

This is not an error. The creation script is designed to skip existing OUs.

---

## 🧾 Command Reference

| Command | Run on | Purpose | Expected result |
|---|---|---|---|
| `Get-ADDomain` | Server | Confirms domain context | Shows `W2K16AD.local` domain details |
| `Get-ADOrganizationalUnit -Filter *` | Server | Lists AD OUs | Shows created OUs |
| `Get-ADComputer W11-CLIENT01` | Server | Finds client object | Shows client computer object |
| `Move-ADObject` | Server | Moves AD object | Object appears in target OU |
| `create-lab06-ou-structure.ps1` | Server | Creates OU structure | OUs created or skipped if existing |
| `verify-lab06-ou-structure.ps1` | Server | Verifies OU structure | PASS for all expected OUs |
| `move-lab06-client-to-workstations-ou.ps1` | Server | Moves client object | Client appears in Workstations OU |

---

## ✅ Completion Checklist

- [ ] ADUC opened and domain root reviewed.
- [ ] Top-level OU `AdelaideTechSolutions` created.
- [ ] Core OUs created.
- [ ] Department OUs created.
- [ ] User management OUs created.
- [ ] Computer management OUs created.
- [ ] Group management OUs created.
- [ ] OU structure verified with PowerShell.
- [ ] `W11-CLIENT01` moved to the Workstations OU.
- [ ] Computer object location verified with PowerShell.
- [ ] Scripts reviewed and saved in the `scripts` folder.

---

## 🧠 Key Takeaways

| Key point | Why it matters |
|---|---|
| 1 | OUs organize users, computers, groups and service accounts. |
| 2 | Clean OU design makes administration easier. |
| 3 | Computer objects should be moved out of default containers. |
| 4 | Scripts make AD administration repeatable and consistent. |
| 5 | PowerShell verification is useful for troubleshooting and documentation. |

---

## 👤 Author

**Xuan Toan Nguyen**  
IT Support | Service Desk | Desktop Support | System Administration  
Adelaide, South Australia

- 🔗 LinkedIn: [www.linkedin.com/in/toan-nguyen-it-oz](https://www.linkedin.com/in/toan-nguyen-it-oz)
- 💻 GitHub: [github.com/toannguyenitoz](https://github.com/toannguyenitoz)

---

<p align="center"><a href="../05-join-windows-11-client-to-domain/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../07-active-directory-user-management/README.md">Next Lab ➜</a> · <a href="#top">⬆ Back to Top</a></p>
