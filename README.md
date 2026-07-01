<a id="top"></a>

# 🖥️ Windows Active Directory Support Labs

<p align="center">
  <img src="https://img.shields.io/badge/Windows%2011-Client-0078D4?logo=windows&logoColor=white" alt="Windows 11">
  <img src="https://img.shields.io/badge/Windows%20Server-Admin-5E5E5E?logo=windows&logoColor=white" alt="Windows Server">
  <img src="https://img.shields.io/badge/Active%20Directory-User%20Guide-6A1B9A" alt="Active Directory">
  <img src="https://img.shields.io/badge/IT%20Support-Step--by--Step-2E7D32" alt="IT Support">
  <img src="https://img.shields.io/badge/Level-Beginner%20to%20Intermediate-F9A825" alt="Level">
  <img src="https://img.shields.io/badge/Status-Ready-1565C0" alt="Ready">
</p>

<p align="center">
  <strong>📘 A practical Windows 11, Windows Server and Active Directory user guide for IT Support, Service Desk, Desktop Support and junior System Administration practice.</strong>
</p>

<p align="center">
  <a href="https://www.linkedin.com/in/toan-nguyen-it-oz">🔗 LinkedIn</a> ·
  <a href="https://github.com/toannguyenitoz">💻 GitHub</a> ·
  <a href="#learning-roadmap">🧭 Learning Roadmap</a> ·
  <a href="#skills-covered">🧰 Skills Covered</a>
</p>

---

## 🎯 Repository Purpose

This repository is a **step-by-step user guide** for building and supporting a small workplace-style Windows environment.

It is written for readers who want to follow the labs and practise real IT Support tasks, including Windows client preparation, Windows Server setup, DNS, Active Directory, domain join, user and group management, file sharing, printer support, Remote Desktop and troubleshooting.

> **Screenshot note:** Screenshots are visual examples for learning and reference. Readers follow the guide and perform the steps in their own environment. New screenshots may be added by the repository author as the labs are completed.

---

## 🧭 Learning Roadmap

| Phase | Focus Area | Labs |
|---|---|---|
| 🟦 Phase 1 | Windows client and server baseline | Lab 01 - Lab 02 |
| 🟨 Phase 2 | Network and DNS foundation | Lab 03 |
| 🟪 Phase 3 | Active Directory setup and domain join | Lab 04 - Lab 05 |
| 🟩 Phase 4 | Users, groups and account support | Lab 06 - Lab 09 |
| 🟧 Phase 5 | File, print and remote administration | Lab 10 - Lab 14 |
| 🟥 Phase 6 | Troubleshooting and documentation | Lab 15 - Lab 16 |

---

## 📚 Lab Index

| Lab | Topic | Level | Status |
|---|---|---|---|
| 01 | 🪟 [Windows 11 Client Initial Configuration](labs/01-windows-11-client-initial-configuration/README.md) | Beginner | ✅ Ready |
| 02 | 🖥️ [Windows Server Initial Configuration](labs/02-windows-server-initial-configuration/README.md) | Beginner | ✅ Ready |
| 03 | 🌐 [Network and DNS Configuration](labs/03-network-and-dns-configuration/README.md) | Beginner | ✅ Ready |
| 04 | 🏢 [Active Directory Domain Services Setup](labs/04-active-directory-domain-services-setup/README.md) | Intermediate | ✅ Ready |
| 05 | 🔗 [Join Windows 11 Client to Domain](labs/05-join-windows-11-client-to-domain/README.md) | Intermediate | ✅ Ready |
| 06 | 🗂️ [Active Directory OU Structure](labs/06-active-directory-ou-structure/README.md) | Intermediate | ✅ Ready |
| 07 | 👤 [Active Directory User Management](labs/07-active-directory-user-management/README.md) | Intermediate | ✅ Ready |
| 08 | 👥 [Active Directory Group Management](labs/08-active-directory-group-management/README.md) | Intermediate | ✅ Ready |
| 09 | 🔐 [Password, Lockout and Logon Controls](labs/09-password-lockout-logon-controls/README.md) | Intermediate | ✅ Ready |
| 10 | 📁 [Home Folder and File Share](labs/10-home-folder-and-file-share/README.md) | Intermediate | ✅ Ready |
| 11 | 🛠️ [RSAT Remote Administration](labs/11-rsat-remote-administration/README.md) | Intermediate | ✅ Ready |
| 12 | 💻 [Second Client and Computer Management](labs/12-second-client-computer-management/README.md) | Intermediate | ✅ Ready |
| 13 | 🖨️ [Print Server and Network Printer](labs/13-print-server-and-network-printer/README.md) | Intermediate | ✅ Ready |
| 14 | 🛰️ [Remote Desktop Support](labs/14-remote-desktop-support/README.md) | Intermediate | ✅ Ready |
| 15 | 🧪 [Network Troubleshooting: Wi-Fi and IP](labs/15-network-troubleshooting-wifi-ip/README.md) | Beginner | ✅ Ready |
| 16 | 📝 [Service Desk Documentation and Case Notes](labs/16-service-desk-documentation/README.md) | Beginner | ✅ Ready |

---

## 🧱 Example Lab Environment

| Component | Example Value |
|---|---|
| 🪟 Client OS | Windows 11 Pro / Enterprise / Education |
| 🖥️ Server OS | Windows Server 2019 / 2022 |
| 🏢 Domain Name | `corp.local` |
| 🧭 Domain Controller | `SRV-DC01` |
| 💻 Client Computer | `W11-CLIENT01` |
| 💻 Second Client | `W11-CLIENT02` |
| 🌐 Server IP | `192.168.20.10` |
| 🌐 Client IP | `192.168.20.101` |
| 🔎 DNS Server | Domain Controller IP |

> Use values that match your own lab, but keep naming and IP addressing consistent across all labs.

---

<a id="skills-covered"></a>

## 🧰 Skills Covered

| Area | Practical Skills |
|---|---|
| 🪟 Windows Client | Device naming, system checks, network checks, Remote Desktop review |
| 🖥️ Windows Server | Server Manager, hostname, IP review, role preparation |
| 🌐 Networking | Static IP, DNS, connectivity testing, name resolution |
| 🏢 Active Directory | Domain Services, domain join, OUs, users, groups, computer objects |
| 🔐 Account Support | Password reset workflow, account status, lockout review, logon controls |
| 📁 File Services | Shared folders, access testing, share and NTFS permission concepts |
| 🖨️ Print Support | Print Management, shared printer workflow, queue checks |
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
6. Review the completion checklist.
7. Continue to the next lab.

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

- 🔗 LinkedIn: [www.linkedin.com/in/toan-nguyen-it-oz](https://www.linkedin.com/in/toan-nguyen-it-oz)
- 💻 GitHub: [github.com/toannguyenitoz](https://github.com/toannguyenitoz)

---

<p align="center">
  <a href="#top">⬆ Back to Top</a>
</p>
