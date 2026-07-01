<a id="top"></a>

# Lab 09 — Password, Lockout and Logon Controls

<p align="center">
  <img src="https://img.shields.io/badge/Active%20Directory-Account%20Support-6A1B9A" alt="Active Directory">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-green" alt="IT Support">
  <img src="https://img.shields.io/badge/Level-Intermediate-orange" alt="Intermediate">
</p>

<p align="center">
  <a href="../08-active-directory-group-management/README.md">Previous Lab</a> | <a href="../../README.md">Main README</a> | <a href="../10-home-folder-and-file-share/README.md">Next Lab</a>
</p>

---

## Overview

This lab explains common account support tasks in Active Directory.

Service Desk and IT Support teams often help users who cannot sign in, need their account reviewed, or require access to be temporarily disabled. This guide shows the normal administrative workflow in a lab environment.

---

## Objectives

- Review the account properties page.
- Reset a lab user password.
- Unlock a locked account when the option is available.
- Disable and enable a user account.
- Review logon hours and account expiry settings.
- Record the support action clearly.

---

## Example Account Used in This Guide

| Item | Value |
|---|---|
| User account | `j.smith` |
| OU | `Company > Users` |
| Client test computer | `W11-CLIENT01` |
| Domain | `corp.local` |

---

## Before You Start

Complete the user and group labs first.

Use a lab account only. Do not use a real business user account.

---

## Step 1 — Open the User Account

Open:

```text
Server Manager > Tools > Active Directory Users and Computers
```

Browse to:

```text
corp.local > Company > Users
```

Open the properties of:

```text
j.smith
```

---

## Step 2 — Review the Account Tab

In the user properties window, open:

```text
Account
```

Review common support fields:

```text
User logon name
Account options
Account expiry
Logon hours
Account status
```

This page is commonly used when investigating user access issues.

---

## Step 3 — Reset the Lab User Password

Right-click the user account and choose the password reset option.

Use a lab-safe temporary password and choose the appropriate option for the scenario.

After the reset, explain to the reader that in a workplace environment this action should follow identity verification and company policy.

---

## Step 4 — Test Sign-In from the Client

On the Windows 11 client, test sign-in using the lab user account:

```text
CORP\j.smith
```

Confirm whether sign-in works as expected.

---

## Step 5 — Review Account Lockout State

If the account is locked in the lab, open the user properties and review the Account tab.

Unlock the account only if the lockout option is shown and the lab scenario requires it.

Then test sign-in again from the Windows 11 client.

---

## Step 6 — Disable the Account

In Active Directory Users and Computers, disable the account.

Try signing in from the Windows 11 client and observe the result.

This demonstrates how disabling an account affects user access.

---

## Step 7 — Enable the Account Again

Enable the user account again.

Test sign-in once more and confirm that normal access is restored.

---

## Step 8 — Review Logon Hours and Account Expiry

Open the Account tab and review:

```text
Logon Hours
Account Expires
```

These settings are useful when an account should only be valid during certain times or for a limited period.

---

## Step 9 — Write a Support Note

Record a short support note that includes:

```text
User account checked
Action performed
Result after testing
Follow-up required or not required
```

Good notes help the next support person understand what happened.

---

## Completion Checklist

- [ ] User account located.
- [ ] Account tab reviewed.
- [ ] Lab password reset practiced.
- [ ] Sign-in test completed.
- [ ] Lockout state reviewed.
- [ ] Account disable test completed.
- [ ] Account enabled again.
- [ ] Logon hours and expiry reviewed.
- [ ] Support note written.

---

## Key Takeaways

- Account support tasks should be completed carefully and documented.
- Password resets and unlock actions should follow proper verification in real workplaces.
- Disabling an account is a quick way to stop normal sign-in.
- Good case notes are part of good technical support.

---

<p align="center">
  <a href="../08-active-directory-group-management/README.md">Previous Lab</a> | <a href="../../README.md">Main README</a> | <a href="../10-home-folder-and-file-share/README.md">Next Lab</a> | <a href="#top">Back to Top</a>
</p>
