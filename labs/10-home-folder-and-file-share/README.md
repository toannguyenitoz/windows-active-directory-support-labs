<a id="top"></a>

# Lab 10 — Home Folder and File Share

<p align="center">
  <img src="https://img.shields.io/badge/Windows%20Server-File%20Share-5E5E5E?logo=windows&logoColor=white" alt="Windows Server">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-green" alt="IT Support">
  <img src="https://img.shields.io/badge/Level-Intermediate-orange" alt="Intermediate">
</p>

<p align="center">
  <a href="../09-password-lockout-logon-controls/README.md">Previous Lab</a> | <a href="../../README.md">Main README</a> | <a href="../11-rsat-remote-administration/README.md">Next Lab</a>
</p>

---

## Overview

This lab explains how to create a basic server file share and connect it to a domain user workflow.

File shares are common in workplace environments. IT Support staff often need to check whether a user can access a shared folder, confirm mapped drives, and understand the difference between share permissions and NTFS permissions.

---

## Objectives

- Create a folder on Windows Server for shared data.
- Share the folder with a clear share name.
- Review share permissions.
- Review NTFS permissions.
- Test access from the Windows 11 client.
- Create a simple test file to confirm access.

---

## Lab Values Used in This Guide

| Item | Value |
|---|---|
| Server | `SRV-DC01` |
| Client | `W11-CLIENT01` |
| Share folder | `C:\Shares\SharedData` |
| Share name | `SharedData` |
| Test user | `j.smith` |
| Test group | `GG_StandardUsers` |

---

## Before You Start

Complete the user and group management labs first.

Confirm that the Windows 11 client can sign in with a domain account.

---

## Step 1 — Create the Server Folder

On the server, create a new folder:

```text
C:\Shares\SharedData
```

This folder will be used as the shared location for the lab.

---

## Step 2 — Open Folder Properties

Right-click the folder and open:

```text
Properties
```

Review these tabs:

```text
Sharing
Security
```

The Sharing tab controls network access to the folder.

The Security tab controls NTFS permissions on the folder.

---

## Step 3 — Share the Folder

On the Sharing tab, open advanced sharing and enable sharing for the folder.

Use the share name:

```text
SharedData
```

The shared path will be:

```text
\\SRV-DC01\SharedData
```

---

## Step 4 — Review Share Permissions

Review which users or groups can access the share.

For a simple lab, assign access to a group such as:

```text
GG_StandardUsers
```

In real workplaces, access should be managed through groups, not by adding individual users one by one.

---

## Step 5 — Review NTFS Permissions

Open the Security tab and review folder permissions.

Confirm that the correct group has the access required for the lab.

Remember:

- Share permissions apply over the network.
- NTFS permissions apply to the folder itself.
- The most restrictive effective permission normally wins.

---

## Step 6 — Test Access from the Windows 11 Client

Sign in to the Windows 11 client as the test domain user.

Open File Explorer and enter:

```text
\\SRV-DC01\SharedData
```

Confirm the shared folder opens.

---

## Step 7 — Create a Test File

Inside the shared folder, create a simple test file.

Example:

```text
access-test.txt
```

Add a short test note and save the file.

This confirms that the user has write access if write permission was intended.

---

## Step 8 — Verify from the Server

On the server, open:

```text
C:\Shares\SharedData
```

Confirm that the test file created from the client appears on the server.

---

## Step 9 — Optional Mapped Drive Test

On the client, open Command Prompt and run:

```cmd
net use
```

This displays current network drive connections.

A mapped drive can also be created later through Group Policy or manually for testing.

---

## Completion Checklist

- [ ] Server folder created.
- [ ] Folder shared with a clear share name.
- [ ] Share permissions reviewed.
- [ ] NTFS permissions reviewed.
- [ ] Client can open the shared path.
- [ ] Test file created from the client.
- [ ] Test file confirmed on the server.
- [ ] Difference between share and NTFS permissions understood.

---

## Key Takeaways

- File access should usually be managed through groups.
- Share permissions and NTFS permissions both affect access.
- Testing from the client confirms the real user experience.
- Clear share names make support easier.

---

<p align="center">
  <a href="../09-password-lockout-logon-controls/README.md">Previous Lab</a> | <a href="../../README.md">Main README</a> | <a href="../11-rsat-remote-administration/README.md">Next Lab</a> | <a href="#top">Back to Top</a>
</p>
