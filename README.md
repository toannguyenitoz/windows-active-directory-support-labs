<a id="top"></a>

# 🖥️ Windows Active Directory Support Labs

<p align="center">
  <img src="https://img.shields.io/badge/Windows%2011-Client-0078D4?logo=windows&logoColor=white" alt="Windows 11">
  <img src="https://img.shields.io/badge/Windows%20Server-Admin-5E5E5E?logo=windows&logoColor=white" alt="Windows Server">
  <img src="https://img.shields.io/badge/Active%20Directory-Guide-6A1B9A" alt="Active Directory">
  <img src="https://img.shields.io/badge/IT%20Support-Step--by--Step-green" alt="IT Support">
  <img src="https://img.shields.io/badge/Status-Ready-yellow" alt="Ready">
</p>

<p align="center">
  <strong>Step-by-step Windows 11 and Active Directory support guide for IT Support, Service Desk, Desktop Support and junior System Administration practice.</strong>
</p>

<p align="center">
  <a href="https://www.linkedin.com/in/toan-nguyen-it-oz">LinkedIn</a> ·
  <a href="https://github.com/toannguyenitoz">GitHub</a>
</p>

---

## 📌 Repository Purpose

This repository is a practical user guide for building and supporting a small workplace-style Windows environment.

It is designed so IT Support learners and junior administrators can follow clear instructions, complete each configuration task, run the required commands, and understand how Windows clients work with Windows Server, DNS, Active Directory, file sharing, printer support, Remote Desktop and troubleshooting workflows.

Screenshots are intentionally kept as replaceable files. You can follow each lab, capture your own screenshots, and replace the placeholder images in the matching `assets/images/` folder.

---

## 🧭 Learning Path

| Lab | Topic | Level | Status |
|---|---|---|---|
| 01 | [Windows 11 Client Initial Configuration](labs/01-windows-11-client-initial-configuration/README.md) | Beginner | Ready |
| 02 | [Windows Server Initial Configuration](labs/02-windows-server-initial-configuration/README.md) | Beginner | Ready |
| 03 | [Network and DNS Configuration](labs/03-network-and-dns-configuration/README.md) | Beginner | Ready |
| 04 | [Active Directory Domain Services Setup](labs/04-active-directory-domain-services-setup/README.md) | Intermediate | Ready |
| 05 | [Join Windows 11 Client to Domain](labs/05-join-windows-11-client-to-domain/README.md) | Intermediate | Ready |
| 06 | [Active Directory OU Structure](labs/06-active-directory-ou-structure/README.md) | Intermediate | Ready |
| 07 | [Active Directory User Management](labs/07-active-directory-user-management/README.md) | Intermediate | Ready |
| 08 | [Active Directory Group Management](labs/08-active-directory-group-management/README.md) | Intermediate | Ready |
| 09 | [Password, Lockout and Logon Controls](labs/09-password-lockout-logon-controls/README.md) | Intermediate | Ready |
| 10 | [Home Folder and File Share](labs/10-home-folder-and-file-share/README.md) | Intermediate | Ready |
| 11 | [RSAT Remote Administration](labs/11-rsat-remote-administration/README.md) | Intermediate | Ready |
| 12 | [Second Client and Computer Management](labs/12-second-client-computer-management/README.md) | Intermediate | Ready |
| 13 | [Print Server and Network Printer](labs/13-print-server-and-network-printer/README.md) | Intermediate | Ready |
| 14 | [Remote Desktop Support](labs/14-remote-desktop-support/README.md) | Intermediate | Ready |
| 15 | [Network Troubleshooting: Wi-Fi and IP](labs/15-network-troubleshooting-wifi-ip/README.md) | Beginner | Ready |
| 16 | [Service Desk Documentation and Case Notes](labs/16-service-desk-documentation/README.md) | Beginner | Ready |

---

## 🧱 Example Lab Environment

| Component | Example Value |
|---|---|
| Client OS | Windows 11 Pro / Enterprise / Education |
| Server OS | Windows Server 2019 / 2022 |
| Domain Name | `corp.local` |
| Domain Controller | `SRV-DC01` |
| Client Computer | `W11-CLIENT01` |
| Second Client | `W11-CLIENT02` |
| Server IP | `192.168.20.10` |
| Client IP | `192.168.20.101` |
| DNS Server | Domain Controller IP |

> You can change names and IP addresses to match your own lab, but keep a consistent naming standard.

---

## 🧰 Skills Covered

- Windows 11 workstation baseline configuration
- Windows Server baseline configuration
- Static IP and DNS configuration
- Active Directory Domain Services setup
- Domain join process
- Organizational Units, users and groups
- Password reset and account unlock workflow
- File sharing and home folders
- RSAT remote administration
- Printer support and print queue management
- Remote Desktop support workflow
- Network troubleshooting with `ipconfig`, `ping`, `nslookup` and related tools
- Service desk case notes and support documentation

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

## 🚀 How to Use This Guide

1. Start from Lab 01.
2. Complete each step in order.
3. Run the verification commands.
4. Replace placeholder screenshots with your own screenshots.
5. Tick the completion checklist.
6. Continue to the next lab.

---

## 👤 Author

**Xuan Toan Nguyen**  
IT Support | Service Desk | Desktop Support | System Administration  
Adelaide, South Australia

- LinkedIn: [www.linkedin.com/in/toan-nguyen-it-oz](https://www.linkedin.com/in/toan-nguyen-it-oz)
- GitHub: [github.com/toannguyenitoz](https://github.com/toannguyenitoz)

---

<p align="center">
  <a href="#top">⬆ Back to Top</a>
</p>
