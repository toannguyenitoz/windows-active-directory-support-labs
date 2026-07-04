<a id="top"></a>

# 🖥️ Windows Active Directory Support Labs

<p align="center">
  <img src="https://img.shields.io/badge/Windows%2011-Client-0078D4?logo=windows&logoColor=white" alt="Windows 11">
  <img src="https://img.shields.io/badge/Windows%20Server-Admin-5E5E5E?logo=windows&logoColor=white" alt="Windows Server">
  <img src="https://img.shields.io/badge/Active%20Directory-User%20Guide-6A1B9A" alt="Active Directory">
  <img src="https://img.shields.io/badge/Group%20Policy-GPO%20Management-1565C0" alt="Group Policy">
  <img src="https://img.shields.io/badge/IT%20Support-Step--by--Step-2E7D32" alt="IT Support">
  <img src="https://img.shields.io/badge/Level-Beginner%20to%20Intermediate-F9A825" alt="Level">
  <img src="https://img.shields.io/badge/Status-In%20Progress-FF8F00" alt="In Progress">
</p>

<p align="center">
  <strong>📘 A practical Windows 11, Windows Server and Active Directory user guide for IT Support, Service Desk, Desktop Support and junior System Administration practice.</strong>
</p>

<p align="center">
  <a href="https://www.linkedin.com/in/toan-nguyen-it-oz">🔗 LinkedIn</a> ·
  <a href="https://github.com/toannguyenitoz">💻 GitHub</a> ·
  <a href="#learning-roadmap">🧭 Learning Roadmap</a> ·
  <a href="#lab-index">📚 Lab Index</a> ·
  <a href="#skills-covered">🧰 Skills Covered</a>
</p>

---

## 🎯 Repository Purpose

This repository is a **step-by-step user guide** for building and supporting a small workplace-style Windows environment.

It is written for readers who want to follow the labs and practise real IT Support tasks, including Windows client preparation, Windows Server setup, DNS, Active Directory, domain join, OU design, user and group management, password support, file sharing, RSAT remote administration, Group Policy management, printer support, Remote Desktop and troubleshooting.

> **Screenshot note:** Screenshots are visual examples for learning and reference. Readers follow the guide and perform the steps in their own environment. Some labs may include image placeholders first, and screenshots may be copied into the repository after the lab is completed.

---

<a id="learning-roadmap"></a>

## 🧭 Learning Roadmap

| Phase | Focus Area | Labs |
|---|---|---|
| 🟦 Phase 1 | Windows client and server baseline | Lab 01 - Lab 02 |
| 🟨 Phase 2 | Network and DNS foundation | Lab 03 |
| 🟪 Phase 3 | Active Directory setup and domain join | Lab 04 - Lab 05 |
| 🟩 Phase 4 | Active Directory structure, users, groups and account support | Lab 06 - Lab 09 |
| 🟧 Phase 5 | File services, RSAT remote administration and Group Policy | Lab 10 - Lab 12 |
| 🟥 Phase 6 | Print support, remote support, troubleshooting and documentation | Lab 13 - Lab 16 |

---

<a id="lab-index"></a>

## 📚 Lab Index

| Lab | Topic | Main Practical Outcome | Level | Status |
|---|---|---|---|---|
| 01 | 🪟 [Windows 11 Client Initial Configuration](labs/01-windows-11-client-initial-configuration/README.md) | Prepare and document a Windows 11 client baseline | Beginner | ✅ Ready |
| 02 | 🖥️ [Windows Server Initial Configuration](labs/02-windows-server-initial-configuration/README.md) | Prepare and document a Windows Server baseline | Beginner | ✅ Ready |
| 03 | 🌐 [Network and DNS Configuration](labs/03-network-and-dns-configuration/README.md) | Configure static IP, DNS and connectivity checks | Beginner | ✅ Ready |
| 04 | 🏢 [Active Directory Domain Services Setup](labs/04-active-directory-domain-services-setup/README.md) | Promote the server to a Domain Controller | Intermediate | ✅ Ready |
| 05 | 🔗 [Join Windows 11 Client to Domain](labs/05-join-windows-11-client-to-domain/README.md) | Join a Windows 11 client to the AD domain | Intermediate | ✅ Ready |
| 06 | 🗂️ [Active Directory OU Structure](labs/06-active-directory-ou-structure/README.md) | Build a clean OU structure for users, groups and devices | Intermediate | ✅ Ready |
| 07 | 👤 [Active Directory User Management](labs/07-active-directory-user-management/README.md) | Create, edit, disable and verify user accounts | Intermediate | ✅ Ready |
| 08 | 👥 [Active Directory Group Management](labs/08-active-directory-group-management/README.md) | Create groups and manage group membership | Intermediate | ✅ Ready |
| 09 | 🔐 [Password, Lockout and Logon Controls](labs/09-password-lockout-logon-controls/README.md) | Practise password reset, lockout and account status support | Intermediate | ✅ Ready |
| 10 | 📁 [Home Folder and File Share](labs/10-home-folder-and-file-share/README.md) | Configure home folders, shared data and access testing | Intermediate | ✅ Ready |
| 11 | 🛠️ [RSAT Remote Administration](labs/11-rsat-remote-administration/README.md) | Administer Active Directory remotely from Windows 11 | Intermediate | ✅ Ready |
| 12 | 🧩 [Group Policy Management & User Environment Control](labs/12-second-client-computer-management/README.md) | Create and apply user-focused GPO settings | Intermediate | 🟡 Image placeholders ready |
| 13 | 🖨️ [Print Server and Network Printer](labs/13-print-server-and-network-printer/README.md) | Practise print server, shared printer and queue support | Intermediate | ✅ Ready |
| 14 | 🛰️ [Remote Desktop Support](labs/14-remote-desktop-support/README.md) | Practise safe Remote Desktop support workflow | Intermediate | ✅ Ready |
| 15 | 🧪 [Network Troubleshooting: Wi-Fi and IP](labs/15-network-troubleshooting-wifi-ip/README.md) | Troubleshoot common IP, DNS and connectivity issues | Beginner | ✅ Ready |
| 16 | 📝 [Service Desk Documentation and Case Notes](labs/16-service-desk-documentation/README.md) | Write support notes, case summaries and resolutions | Beginner | ✅ Ready |

---

## 🧱 Example Lab Environment

| Component | Example Value |
|---|---|
| 🪟 Client OS | Windows 11 Pro / Enterprise / Education |
| 🖥️ Server OS | Windows Server 2019 / 2022 |
| 🏢 Domain Name | `W2K16AD.local` |
| 🧭 Domain Controller | `SRV-DC01` |
| 💻 Client Computer | `W11-CLIENT01` |
| 🌐 Server IP | `192.168.20.10` |
| 🌐 Client IP | `192.168.20.101` |
| 🔎 DNS Server | Domain Controller IP |
| 🗂️ Root OU | `AdelaideTechSolutions` |
| 👤 Standard Users OU | `AdelaideTechSolutions > Users > StandardUsers` |
| 📁 Shared Data Path | `\\SRV-DC01\SharedData` |
| 🛠️ Admin Tools | ADUC, GPMC, PowerShell, RSAT |

> Use values that match your own lab, but keep naming, IP addressing and OU structure consistent across all labs.

---

<a id="skills-covered"></a>

## 🧰 Skills Covered

| Area | Practical Skills |
|---|---|
| 🪟 Windows Client | Device naming, system checks, network checks, domain sign-in, Remote Desktop review |
| 🖥️ Windows Server | Server Manager, hostname, static IP review, role preparation and service checks |
| 🌐 Networking | Static IP, DNS, connectivity testing, name resolution and troubleshooting |
| 🏢 Active Directory | Domain Services, domain join, OUs, users, groups and object organization |
| 🔐 Account Support | Password reset workflow, account status, lockout review and logon controls |
| 📁 File Services | Shared folders, access testing, home folders, share and NTFS permission concepts |
| 🛠️ RSAT Administration | Remote ADUC administration, admin workstation workflow and AD PowerShell checks |
| 🧩 Group Policy | GPO creation, OU linking, drive mapping, desktop shortcuts, gpupdate and gpresult verification |
| 🖨️ Print Support | Print Management, shared printer workflow and print queue checks |
| 🛰️ Remote Support | Remote Desktop connection workflow and safe support behaviour |
| 📝 Documentation | Troubleshooting notes, case summaries and final resolution notes |

---

## 🚀 How to Follow This User Guide

This guide is designed for readers to **follow and perform** the labs in order.

1. Start from **Lab 01**.
2. Read the objective and lab values.
3. Follow each configuration step in order.
4. Run the verification commands.
5. Compare the result with the expected outcome.
6. Add or review screenshots for visual evidence.
7. Review the completion checklist.
8. Continue to the next lab.

---

## 📁 Repository Structure

```text
windows-active-directory-support-labs/
├── README.md
├── CHANGELOG.md
├── CONTRIBUTING.md
├── PROJECT_BOARD.md
├── docs/
├── labs/
├── scripts/
├── templates/
└── assets/
    └── images/
```

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
  <a href="#top">⬆ Back to Top</a>
</p>

<p align="center">
  <strong>#ToanNguyenITOz #Windows11 #WindowsServer #ActiveDirectory #GroupPolicy #ITSupport #ServiceDesk #SystemAdministration</strong>
</p>
