<a id="top"></a>

# 🛰️ Lab 14 — Remote Desktop Support

<p align="center">
  <img src="https://img.shields.io/badge/Windows-Remote%20Support-0078D4?logo=windows&logoColor=white" alt="Remote Desktop Support">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-2E7D32" alt="Guide">
  <img src="https://img.shields.io/badge/Level-Intermediate-F9A825" alt="Intermediate">
</p>

<p align="center"><a href="../13-print-server-and-network-printer/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../15-network-troubleshooting-wifi-ip/README.md">Next Lab ➜</a></p>

---

## 🎯 Lab Mission

Practise a basic Remote Desktop support workflow.

> [!NOTE]
> This lab is written as a user guide. Follow the steps in order and compare your result with the expected checks.

## ✅ What You Will Learn

- Review Remote Desktop availability.
- Confirm target hostname and IP.
- Test connectivity.
- Connect using Remote Desktop.
- Close the session safely.

## 🧱 Lab Values

| Item | Value |
|---|---|
| Support computer | `W11-CLIENT01` |
| Target computer | `W11-CLIENT02` or `SRV-DC01` |
| Tool | Remote Desktop Connection |

## 🧩 Before You Start

- Use Remote Desktop only where you have permission.
- Confirm the target is powered on.

> [!WARNING]
> Use a lab environment only. Do not publish real passwords, personal information, client data or internal business details.

## 🚀 Step-by-Step Guide

### 🛰️ Step 1 — Review Remote Desktop on target

Open Settings > System > Remote Desktop.

> [!TIP]
> Target must allow remote connections.

### 💻 Step 2 — Confirm target name

Run hostname on target.

Run:

```cmd
hostname
```

> [!TIP]
> Record the name.

### 🌐 Step 3 — Confirm target IP

Run ipconfig on target.

Run:

```cmd
ipconfig
```

> [!TIP]
> Record IPv4 address.

### 📡 Step 4 — Test connectivity

Ping target name or IP from support computer.

Run:

```cmd
ping W11-CLIENT02
```

> [!TIP]
> Successful ping confirms connectivity.

### 🪟 Step 5 — Open Remote Desktop Connection

Run mstsc.

Run:

```cmd
mstsc
```

> [!TIP]
> Remote Desktop client opens.

### 🔗 Step 6 — Connect to target

Enter target name or IP and sign in with approved account.

> [!TIP]
> Session should open.

### 🧪 Step 7 — Complete support check

Open Settings or Command Prompt inside remote session.

> [!TIP]
> Confirms session is usable.

### 🔚 Step 8 — Close session safely

Sign out or disconnect.

> [!TIP]
> Communicate with user in real support work.

---

## 🧾 Command Reference

| Command | Run on | Purpose | Expected result |
|---|---|---|---|
| `hostname` | Target | Confirms target computer name | Shows expected hostname |
| `ipconfig` | Target | Shows target IP | IPv4 visible |
| `mstsc` | Support computer | Opens Remote Desktop Connection | RDP client opens |

---

## ✅ Completion Checklist

- [ ] Remote Desktop availability reviewed.
- [ ] Target name confirmed.
- [ ] Target IP confirmed.
- [ ] Connectivity tested.
- [ ] Remote Desktop opened.
- [ ] Remote session established.
- [ ] Basic support check completed.
- [ ] Session closed safely.

---

## 🧠 Key Takeaways

| Key point | Why it matters |
|---|---|
| 1 | Remote Desktop requires target settings and network connectivity. |
| 2 | Computer name and IP are both useful for testing. |
| 3 | Remote support should be performed with permission and clear communication. |

---

## 👤 Author

**Xuan Toan Nguyen**  
IT Support | Service Desk | Desktop Support | System Administration  
Adelaide, South Australia

- 🔗 LinkedIn: [www.linkedin.com/in/toan-nguyen-it-oz](https://www.linkedin.com/in/toan-nguyen-it-oz)
- 💻 GitHub: [github.com/toannguyenitoz](https://github.com/toannguyenitoz)

---

<p align="center"><a href="../13-print-server-and-network-printer/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../15-network-troubleshooting-wifi-ip/README.md">Next Lab ➜</a> · <a href="#top">⬆ Back to Top</a></p>