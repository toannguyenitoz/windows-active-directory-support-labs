<a id="top"></a>

# 🌐 Lab 03 — Network and DNS Configuration

<p align="center">
  <img src="https://img.shields.io/badge/Networking-DNS-1565C0" alt="Network and DNS Configuration">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-2E7D32" alt="Guide">
  <img src="https://img.shields.io/badge/Level-Beginner-1565C0" alt="Beginner">
</p>

<p align="center"><a href="../02-windows-server-initial-configuration/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../04-active-directory-domain-services-setup/README.md">Next Lab ➜</a></p>

---

## 🎯 Lab Mission

Configure the network and DNS foundation required before Active Directory and domain join can work reliably.

> [!NOTE]
> This lab is written as a user guide. Follow the steps in order and compare your result with the expected checks.

## ✅ What You Will Learn

- Configure or confirm server IPv4 settings.
- Point the Windows 11 client DNS server to the domain controller.
- Test client-to-server connectivity.
- Record final network values for later labs.

## 🧱 Lab Values

| Item | Value |
|---|---|
| Server IP | `192.168.20.10` |
| Client IP | `192.168.20.101` |
| Subnet mask | `255.255.255.0` |
| Client DNS server | `192.168.20.10` |

## 🧩 Before You Start

- Complete Lab 01 and Lab 02.
- Know which network adapter is active on both client and server.
- Use the same lab network for both machines.

> [!WARNING]
> Use a lab environment only. Do not publish real passwords, personal information, client data or internal business details.

## 🚀 Step-by-Step Guide

### 🔌 Step 1 — Review the server adapter

Open the server network adapter IPv4 properties and review current values.

> [!TIP]
> Changing the wrong adapter is a common lab mistake.

### 🧭 Step 2 — Configure server IPv4

Set server IP, subnet mask and preferred DNS according to the lab design.

> [!TIP]
> The server will use itself as DNS after DNS services are installed.

### 🧪 Step 3 — Verify server IP configuration

Confirm server IPv4 and DNS values.

Run:

```cmd
ipconfig /all
```

> [!TIP]
> Check the adapter name to avoid reading the wrong interface.

### 💻 Step 4 — Configure client DNS

On the Windows 11 client, set the preferred DNS server to `192.168.20.10`.

> [!TIP]
> Domain clients must use the domain DNS service.

### 🔍 Step 5 — Verify client IP configuration

Confirm client IP, network range and DNS server.

Run:

```cmd
ipconfig /all
```

> [!TIP]
> Client and server should be on the same subnet.

### 📡 Step 6 — Test connectivity

From the client, test connectivity to the server.

Run:

```cmd
ping 192.168.20.10
```

> [!TIP]
> Successful replies confirm basic IP connectivity.

### 📝 Step 7 — Record final network values

Record server name, server IP, client name, client IP, client DNS and planned domain name.

> [!TIP]
> These values are used repeatedly in later labs.

---

## 🧾 Command Reference

| Command | Run on | Purpose | Expected result |
|---|---|---|---|
| `ipconfig /all` | Client and server | Shows detailed IP and DNS settings | Correct adapter values are visible |
| `ping 192.168.20.10` | Windows 11 client | Tests connectivity to server | Successful replies received |

---

## ✅ Completion Checklist

- [ ] Server adapter reviewed.
- [ ] Server IPv4 settings configured or confirmed.
- [ ] Server DNS value reviewed.
- [ ] Client DNS points to the server IP.
- [ ] Client IP configuration checked.
- [ ] Client can reach the server.
- [ ] Final network values recorded.

---

## 🧠 Key Takeaways

| Key point | Why it matters |
|---|---|
| 1 | DNS is critical for Active Directory. |
| 2 | Domain clients should use the domain controller DNS service. |
| 3 | `ipconfig /all` and `ping` are essential first-line network checks. |

---

## 👤 Author

**Xuan Toan Nguyen**  
IT Support | Service Desk | Desktop Support | System Administration  
Adelaide, South Australia

- 🔗 LinkedIn: [www.linkedin.com/in/toan-nguyen-it-oz](https://www.linkedin.com/in/toan-nguyen-it-oz)
- 💻 GitHub: [github.com/toannguyenitoz](https://github.com/toannguyenitoz)

---

<p align="center"><a href="../02-windows-server-initial-configuration/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../04-active-directory-domain-services-setup/README.md">Next Lab ➜</a> · <a href="#top">⬆ Back to Top</a></p>