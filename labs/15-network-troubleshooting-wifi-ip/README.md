<a id="top"></a>

# 🧪 Lab 15 — Network Troubleshooting: Wi-Fi and IP

<p align="center">
  <img src="https://img.shields.io/badge/Networking-Troubleshooting-1565C0" alt="Network Troubleshooting: Wi-Fi and IP">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-2E7D32" alt="Guide">
  <img src="https://img.shields.io/badge/Level-Beginner-1565C0" alt="Beginner">
</p>

<p align="center"><a href="../14-remote-desktop-support/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../16-service-desk-documentation/README.md">Next Lab ➜</a></p>

---

## 🎯 Lab Mission

Use a first-level workflow to troubleshoot Windows network issues.

> [!NOTE]
> This lab is written as a user guide. Follow the steps in order and compare your result with the expected checks.

## ✅ What You Will Learn

- Check connection type.
- Review IP configuration.
- Test server connectivity.
- Test DNS name resolution.
- Document the outcome.

## 🧱 Lab Values

| Item | Value |
|---|---|
| Scenario | Cannot access domain resources |
| Server IP | `192.168.20.10` |
| Domain | `corp.local` |

## 🧩 Before You Start

- Use a lab issue or safe simulation.
- Do not change settings before recording current values.

> [!WARNING]
> Use a lab environment only. Do not publish real passwords, personal information, client data or internal business details.

## 🚀 Step-by-Step Guide

### 📶 Step 1 — Confirm connection type

Check Wi-Fi, Ethernet or docking station network status.

> [!TIP]
> Start with physical or connection state.

### 🧭 Step 2 — Check IP configuration

Run ipconfig.

Run:

```cmd
ipconfig
```

> [!TIP]
> Review IPv4, subnet and gateway.

### 🔍 Step 3 — Check detailed network information

Run ipconfig /all.

Run:

```cmd
ipconfig /all
```

> [!TIP]
> Review DNS and adapter details.

### 📡 Step 4 — Test server connectivity

Ping the domain controller.

Run:

```cmd
ping 192.168.20.10
```

> [!TIP]
> Successful reply confirms IP connectivity.

### 🌐 Step 5 — Test domain name resolution

Run nslookup.

Run:

```cmd
nslookup corp.local
```

> [!TIP]
> If this fails, DNS is likely involved.

### 🖥️ Step 6 — Test computer name resolution

Ping the server name.

Run:

```cmd
ping SRV-DC01
```

> [!TIP]
> Checks name resolution.

### 🔄 Step 7 — Refresh IP and DNS

Use flushdns, release and renew when appropriate.

Run:

```cmd
ipconfig /flushdns
```

```cmd
ipconfig /release
```

```cmd
ipconfig /renew
```

> [!TIP]
> Use release/renew only when DHCP is used.

### 📝 Step 8 — Record the result

Document issue, tests, findings, likely cause and next action.

> [!TIP]
> Good notes support escalation.

---

## 🧾 Command Reference

| Command | Run on | Purpose | Expected result |
|---|---|---|---|
| `ipconfig` | Client | Shows basic IP info | IPv4 and gateway visible |
| `ipconfig /all` | Client | Shows detailed adapter and DNS data | DNS server visible |
| `ping 192.168.20.10` | Client | Tests server connectivity | Successful replies |
| `nslookup corp.local` | Client | Tests DNS resolution | Domain resolves |

---

## ✅ Completion Checklist

- [ ] Connection type checked.
- [ ] Network status reviewed.
- [ ] ipconfig checked.
- [ ] ipconfig /all checked.
- [ ] Ping tested.
- [ ] DNS lookup tested.
- [ ] Name resolution tested.
- [ ] Repair commands reviewed.
- [ ] Result documented.

---

## 🧠 Key Takeaways

| Key point | Why it matters |
|---|---|
| 1 | Start with simple checks. |
| 2 | IP connectivity and DNS resolution are different tests. |
| 3 | Good troubleshooting notes make escalation easier. |

---

## 👤 Author

**Xuan Toan Nguyen**  
IT Support | Service Desk | Desktop Support | System Administration  
Adelaide, South Australia

- 🔗 LinkedIn: [www.linkedin.com/in/toan-nguyen-it-oz](https://www.linkedin.com/in/toan-nguyen-it-oz)
- 💻 GitHub: [github.com/toannguyenitoz](https://github.com/toannguyenitoz)

---

<p align="center"><a href="../14-remote-desktop-support/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../16-service-desk-documentation/README.md">Next Lab ➜</a> · <a href="#top">⬆ Back to Top</a></p>