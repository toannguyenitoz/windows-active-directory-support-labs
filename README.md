# 🖥️ Windows Active Directory Support Labs

<p align="center">
  <img src="https://img.shields.io/badge/Windows%2011-Client-0078D4?logo=windows&logoColor=white" alt="Windows 11">
  <img src="https://img.shields.io/badge/Windows%20Server-Administration-5E5E5E?logo=windows&logoColor=white" alt="Windows Server">
  <img src="https://img.shields.io/badge/Active%20Directory-Guide-6A1B9A" alt="Active Directory">
  <img src="https://img.shields.io/badge/IT%20Support-Step--by--Step-green" alt="IT Support">
  <img src="https://img.shields.io/badge/Status-Ready-yellow" alt="Status">
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

It is designed so IT Support learners and junior administrators can follow clear instructions, complete each configuration task, run the required commands, and understand how Windows clients work with Windows Server, DNS, Active Directory, file sharing, printer services, Remote Desktop and troubleshooting workflows.

Screenshots will be added progressively after each lab is completed.

---

## 🧭 Learning Path

| Lab | Topic | Status |
|---|---|---|
| 01 | [Windows 11 Client Initial Configuration](labs/01-windows-11-client-initial-configuration/README.md) | Ready |
| 02 | [Windows Server Initial Configuration](labs/02-windows-server-initial-configuration/README.md) | Ready |
| 03 | [Network and DNS Configuration](labs/03-network-and-dns-configuration/README.md) | Ready |
| 04 | [Active Directory Domain Services Setup](labs/04-active-directory-domain-services-setup/README.md) | Ready |
| 05 | [Join Windows 11 Client to Domain](labs/05-join-windows-11-client-to-domain/README.md) | Ready |
| 06 | [Active Directory OU Structure](labs/06-active-directory-ou-structure/README.md) | Ready |
| 07 | [Active Directory User Management](labs/07-active-directory-user-management/README.md) | Ready |
| 08 | [Active Directory Group Management](labs/08-active-directory-group-management/README.md) | Ready |
| 09 | [Password, Lockout and Logon Controls](labs/09-password-lockout-logon-controls/README.md) | Ready |
| 10 | [Home Folder and File Share](labs/10-home-folder-and-file-share/README.md) | Ready |
| 11 | [RSAT Remote Administration](labs/11-rsat-remote-administration/README.md) | Ready |
| 12 | [Second Client and Computer Management](labs/12-second-client-computer-management/README.md) | Ready |
| 13 | [Print Server and Network Printer](labs/13-print-server-and-network-printer/README.md) | Ready |
| 14 | [Remote Desktop Support](labs/14-remote-desktop-support/README.md) | Ready |
| 15 | [Network Troubleshooting: Wi-Fi and IP](labs/15-network-troubleshooting-wifi-ip/README.md) | Ready |
| 16 | [Service Desk Documentation](labs/16-service-desk-documentation/README.md) | Ready |

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

You can change the names and IP addresses to match your own lab.

---

## 🧰 Skills Covered

- Windows 11 workstation baseline configuration
- Windows Server baseline configuration
- Static IP and DNS configuration
- Active Directory Domain Services setup
- Domain join process
- Organizational Units, users and groups
- Password reset and account unlock tasks
- File sharing and home folders
- RSAT remote administration
- Printer support and print queue management
- Remote Desktop support workflow
- Network troubleshooting with `ipconfig`, `ping`, `nslookup` and `tracert`
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
