<a id="top"></a>

# 🔗 Lab 05 — Join Windows 11 Client to Domain

<p align="center">
  <img src="https://img.shields.io/badge/Windows%2011-Domain%20Join-0078D4?logo=windows&logoColor=white" alt="Join Windows 11 Client to Domain">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-2E7D32" alt="Guide">
  <img src="https://img.shields.io/badge/Level-Intermediate-F9A825" alt="Intermediate">
</p>

<p align="center"><a href="../04-active-directory-domain-services-setup/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../06-active-directory-ou-structure/README.md">Next Lab ➜</a></p>

---

## 🎯 Lab Mission

Join the Windows 11 client to the Active Directory domain.

> [!NOTE]
> This lab is written as a user guide. Follow the steps in order and compare your result with the expected checks.

## ✅ What You Will Learn

- Confirm client DNS points to the domain controller.
- Join the client to `W2K16AD.local`.
- Understand which account is required during domain join.
- Restart and test domain sign-in.
- Confirm the computer object appears in Active Directory.

## 🧱 Lab Values

| Item | Value |
|---|---|
| Client name | `W11-CLIENT01` |
| Domain | `W2K16AD.local` |
| Domain controller | `SRV-DC01` |
| DNS server | `192.168.20.10` |
| Domain account example | `W2K16AD\\Administrator` |

## 🧩 Before You Start

- Complete Lab 04 first.
- Confirm the client can reach the server.
- Confirm DNS points to the domain controller.
- Confirm you have a domain account with permission to join computers to the domain.

> [!WARNING]
> Use a lab environment only. Do not publish real passwords, personal information, client data or internal business details.

> [!IMPORTANT]
> When joining a Windows client to a domain, use a **domain account from the Domain Controller**, not a local account from the Windows 11 client.
>
> Correct example:
>
> ```text
> W2K16AD\\Administrator
> ```
>
> Incorrect example:
>
> ```text
> W11-CLIENT01\\Administrator
> ```
>
> The account is checked by Active Directory on `SRV-DC01`. A local client account cannot approve the domain join.

## 🚀 Step-by-Step Guide

### 📡 Step 1 — Test connectivity

Ping the domain controller from the client.

Run:

```cmd
ping 192.168.20.10
```

> [!TIP]
> A reply confirms IP connectivity.

### 🔍 Step 2 — Test name resolution

Check whether the client can resolve the domain name.

Run:

```cmd
nslookup W2K16AD.local
```

> [!TIP]
> If this fails, review client DNS. The client DNS server should point to the Domain Controller IP address.

### ⚙️ Step 3 — Open domain join settings

Open **Settings > System > About > Advanced system settings > Computer Name > Change**.

> [!TIP]
> This is where workgroup/domain membership is changed.

### 🏢 Step 4 — Join the domain

Select **Domain** and enter:

```text
W2K16AD.local
```

When Windows asks for an account, enter a domain account that has permission to join computers to Active Directory.

Example:

```text
W2K16AD\\Administrator
```

> [!IMPORTANT]
> This account comes from the server/domain environment. Do not use the local account from `W11-CLIENT01`.

### 🔁 Step 5 — Restart the client

Restart when prompted.

> [!TIP]
> Restart applies domain membership.

### 👤 Step 6 — Sign in with a domain account

Use one of the following formats:

```text
W2K16AD\\username
```

or

```text
username@W2K16AD.local
```

> [!TIP]
> Domain sign-in confirms the join is usable.

### 🧪 Step 7 — Confirm domain membership

Run verification commands.

Run:

```cmd
hostname
```

```cmd
whoami
```

```cmd
echo %USERDOMAIN%
```

> [!TIP]
> Confirm the user domain and device state.

### 🗂️ Step 8 — Confirm the computer object

Open ADUC and find `W11-CLIENT01`.

> [!TIP]
> This confirms Active Directory knows the client.

---

## 🧯 Common Mistakes

### Using a local client account for domain join

Incorrect:

```text
W11-CLIENT01\\Administrator
```

Correct:

```text
W2K16AD\\Administrator
```

### DNS not pointing to the Domain Controller

Incorrect:

```text
DNS Server: 8.8.8.8
```

Correct:

```text
DNS Server: 192.168.20.10
```

### Client cannot resolve the domain

Verify:

```cmd
nslookup W2K16AD.local
ping SRV-DC01
```

---

## 🧾 Command Reference

| Command | Run on | Purpose | Expected result |
|---|---|---|---|
| `ping 192.168.20.10` | Client | Tests server connectivity | Successful replies |
| `nslookup W2K16AD.local` | Client | Tests DNS/domain lookup | Response from domain DNS |
| `echo %USERDOMAIN%` | Client | Shows sign-in domain | Shows domain value |

---

## ✅ Completion Checklist

- [ ] Client DNS checked.
- [ ] Server connectivity tested.
- [ ] Domain lookup tested.
- [ ] Correct domain account used for domain join.
- [ ] Client joined to `W2K16AD.local`.
- [ ] Client restarted.
- [ ] Domain sign-in tested.
- [ ] Computer object found in AD.

---

## 🧠 Key Takeaways

| Key point | Why it matters |
|---|---|
| 1 | Domain join depends on correct DNS. |
| 2 | Domain join account must come from Active Directory, not the local client computer. |
| 3 | After joining the domain, the client becomes a managed computer. |
| 4 | Domain users can sign in after restart. |

---

## 👤 Author

**Xuan Toan Nguyen**  
IT Support | Service Desk | Desktop Support | System Administration  
Adelaide, South Australia

- 🔗 LinkedIn: [www.linkedin.com/in/toan-nguyen-it-oz](https://www.linkedin.com/in/toan-nguyen-it-oz)
- 💻 GitHub: [github.com/toannguyenitoz](https://github.com/toannguyenitoz)

---

<p align="center"><a href="../04-active-directory-domain-services-setup/README.md">⬅ Previous Lab</a> · <a href="../../README.md">🏠 Main README</a> · <a href="../06-active-directory-ou-structure/README.md">Next Lab ➜</a> · <a href="#top">⬆ Back to Top</a></p>
