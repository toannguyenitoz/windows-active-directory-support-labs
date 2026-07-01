<a id="top"></a>

# 🖨️ Lab 13 — Print Server and Network Printer

<p align="center">
  <img src="https://img.shields.io/badge/Windows%20Server-Print%20Support-5E5E5E?logo=windows&logoColor=white" alt="Print Server and Network Printer">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-2E7D32" alt="Guide">
  <img src="https://img.shields.io/badge/Level-Intermediate-F9A825" alt="Intermediate">
</p>

<p align="center"><a href="../12-second-client-computer-management/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../14-remote-desktop-support/README.md">Next Lab ➜</a></p>

---

## 🎯 Lab Mission

Practise a basic print support workflow in a Windows Server environment.

> [!NOTE]
> This lab is written as a user guide. Follow the steps in order and compare your result with the expected checks.

## ✅ What You Will Learn

- Open Print Management.
- Add or review a lab printer.
- Share the printer.
- Connect from a Windows 11 client.
- Review print queue actions.

## 🧱 Lab Values

| Item | Value |
|---|---|
| Server | `SRV-DC01` |
| Client | `W11-CLIENT01` |
| Printer | `PRN-LAB-01` |
| Share name | `Shared-Printer-01` |

## 🧩 Before You Start

- Client should be joined to the domain.
- Client should reach the server.

> [!WARNING]
> Use a lab environment only. Do not publish real passwords, personal information, client data or internal business details.

## 🚀 Step-by-Step Guide

### 🛠️ Step 1 — Open Server Manager

Use Add Roles and Features to ensure print management tools are available.

> [!TIP]
> Print tools are needed for queue and shared printer management.

### 🖨️ Step 2 — Open Print Management

Open Server Manager > Tools > Print Management.

> [!TIP]
> This is the central print admin console.

### ➕ Step 3 — Add a lab printer

Add a test printer and name it `PRN-LAB-01`.

> [!TIP]
> Use clear naming for support.

### 🌐 Step 4 — Share the printer

Share it as `Shared-Printer-01`.

> [!TIP]
> A clear share name helps users select the right printer.

### 💻 Step 5 — Connect from Windows 11

Open Printers and scanners and add the shared printer.

> [!TIP]
> Client test confirms usability.

### 📄 Step 6 — Review print queue

Review pause, resume and cancel actions.

> [!TIP]
> The queue is a common troubleshooting location.

### 🔍 Step 7 — Basic troubleshooting checks

Check printer visibility, queue state, stuck jobs and server connectivity.

Run:

```cmd
ping 192.168.20.10
```

> [!TIP]
> Start with simple checks.

---

## 🧾 Command Reference

| Command | Run on | Purpose | Expected result |
|---|---|---|---|
| `ping 192.168.20.10` | Client | Tests print server connectivity | Successful replies |
| `control printers` | Client | Opens printers interface | Printer list opens |

---

## ✅ Completion Checklist

- [ ] Print management opened.
- [ ] Lab printer added or reviewed.
- [ ] Printer shared.
- [ ] Client connected.
- [ ] Print queue opened.
- [ ] Queue actions reviewed.
- [ ] Troubleshooting checks reviewed.

---

## 🧠 Key Takeaways

| Key point | Why it matters |
|---|---|
| 1 | Printer names should be easy to identify. |
| 2 | Queue state is important in printer troubleshooting. |
| 3 | Many printer issues involve wrong printer selection, paused queues or connectivity. |

---

## 👤 Author

**Xuan Toan Nguyen**  
IT Support | Service Desk | Desktop Support | System Administration  
Adelaide, South Australia

- 🔗 LinkedIn: [www.linkedin.com/in/toan-nguyen-it-oz](https://www.linkedin.com/in/toan-nguyen-it-oz)
- 💻 GitHub: [github.com/toannguyenitoz](https://github.com/toannguyenitoz)

---

<p align="center"><a href="../12-second-client-computer-management/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../14-remote-desktop-support/README.md">Next Lab ➜</a> · <a href="#top">⬆ Back to Top</a></p>