<a id="top"></a>

# 💻 Lab 12 — Second Client and Computer Management

<p align="center">
  <img src="https://img.shields.io/badge/Windows%2011-Second%20Client-0078D4?logo=windows&logoColor=white" alt="Second Client and Computer Management">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-2E7D32" alt="Guide">
  <img src="https://img.shields.io/badge/Level-Intermediate-F9A825" alt="Intermediate">
</p>

<p align="center"><a href="../11-rsat-remote-administration/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../13-print-server-and-network-printer/README.md">Next Lab ➜</a></p>

---

## 🎯 Lab Mission

Add a second Windows 11 client to the domain and organize computer objects.

> [!NOTE]
> This lab is written as a user guide. Follow the steps in order and compare your result with the expected checks.

## ✅ What You Will Learn

- Rename the second client.
- Configure DNS.
- Join it to the domain.
- Move the computer object into the correct OU.

## 🧱 Lab Values

| Item | Value |
|---|---|
| First client | `W11-CLIENT01` |
| Second client | `W11-CLIENT02` |
| Domain | `corp.local` |
| DNS server | `192.168.20.10` |

## 🧩 Before You Start

- Domain controller must be working.
- First client should already be joined.

> [!WARNING]
> Use a lab environment only. Do not publish real passwords, personal information, client data or internal business details.

## 🚀 Step-by-Step Guide

### 🪟 Step 1 — Check second client

Open About page and review current computer name.

> [!TIP]
> Confirm edition and starting state.

### 🏷️ Step 2 — Rename the second client

Rename to `W11-CLIENT02` and restart.

> [!TIP]
> Consistent naming simplifies management.

### 🌐 Step 3 — Configure DNS

Set DNS to `192.168.20.10` and verify.

Run:

```cmd
ipconfig /all
```

> [!TIP]
> DNS is required for domain join.

### 📡 Step 4 — Test connectivity

Test server and domain lookup.

Run:

```cmd
ping 192.168.20.10
```

```cmd
nslookup corp.local
```

> [!TIP]
> Both tests should work.

### 🔗 Step 5 — Join the domain

Join `corp.local` and restart.

> [!TIP]
> Use an account with join permission.

### 👤 Step 6 — Sign in with domain account

Test domain sign-in.

> [!TIP]
> Confirms the join is usable.

### 🗂️ Step 7 — Move computer object

Move `W11-CLIENT02` to `Company > Computers`.

> [!TIP]
> Keeps computer objects organized.

### ✅ Step 8 — Review both clients

Confirm both clients appear in the Computers OU.

> [!TIP]
> Shows multiple workstations are managed.

---

## 🧾 Command Reference

| Command | Run on | Purpose | Expected result |
|---|---|---|---|
| `hostname` | Second client | Confirms computer name | Shows `W11-CLIENT02` |
| `ipconfig /all` | Second client | Checks DNS/IP values | DNS points to server |
| `nslookup corp.local` | Second client | Tests domain lookup | Domain resolves |

---

## ✅ Completion Checklist

- [ ] Second client renamed.
- [ ] DNS configured.
- [ ] Connectivity tested.
- [ ] Domain lookup tested.
- [ ] Domain join completed.
- [ ] Domain sign-in tested.
- [ ] Computer object moved.
- [ ] Both clients confirmed in AD.

---

## 🧠 Key Takeaways

| Key point | Why it matters |
|---|---|
| 1 | Each workstation should have a consistent name. |
| 2 | DNS must be correct before domain join. |
| 3 | Computer objects should be organized into the correct OU. |

---

## 👤 Author

**Xuan Toan Nguyen**  
IT Support | Service Desk | Desktop Support | System Administration  
Adelaide, South Australia

- 🔗 LinkedIn: [www.linkedin.com/in/toan-nguyen-it-oz](https://www.linkedin.com/in/toan-nguyen-it-oz)
- 💻 GitHub: [github.com/toannguyenitoz](https://github.com/toannguyenitoz)

---

<p align="center"><a href="../11-rsat-remote-administration/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../13-print-server-and-network-printer/README.md">Next Lab ➜</a> · <a href="#top">⬆ Back to Top</a></p>