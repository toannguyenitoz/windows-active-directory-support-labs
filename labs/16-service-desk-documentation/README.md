<a id="top"></a>

# Lab 16 — Service Desk Documentation and Case Notes

<p align="center">
  <img src="https://img.shields.io/badge/Service%20Desk-Documentation-green" alt="Service Desk">
  <img src="https://img.shields.io/badge/IT%20Support-User%20Guide-green" alt="IT Support">
  <img src="https://img.shields.io/badge/Level-Beginner-blue" alt="Beginner">
</p>

<p align="center">
  <a href="../15-network-troubleshooting-wifi-ip/README.md">Previous Lab</a> | <a href="../../README.md">Main README</a>
</p>

---

## Overview

This lab explains how to write clear Service Desk notes after completing technical support work.

Good technical work is only part of IT Support. The ticket must also explain what happened, what was checked, what was changed, what result was confirmed and whether follow-up is required.

---

## Objectives

- Write a clear issue summary.
- Record the affected user, device and service.
- Document troubleshooting steps in order.
- Record findings and resolution.
- Confirm the result after testing.
- Write a professional final case note.

---

## Example Scenario

A user reports:

```text
The Windows 11 client cannot access domain resources.
```

The support person checks network status, DNS settings, server connectivity and domain sign-in.

---

## Step 1 — Write the Issue Summary

Start with a short summary.

Example:

```text
User reported that the Windows 11 client could not access domain resources.
```

A good summary should be short, factual and easy to understand.

---

## Step 2 — Record Basic Details

Record:

```text
User
Computer name
Date and time
Reported issue
Affected service
Business impact
```

Example:

```text
Computer: W11-CLIENT01
Service affected: Domain resources and shared folders
Impact: User unable to access required files
```

---

## Step 3 — Document Troubleshooting Steps

Write the checks in the order they were completed.

Example:

```text
Checked network connection status.
Ran ipconfig /all to review IP and DNS settings.
Tested ping to the domain controller.
Tested name resolution for the domain.
Confirmed user sign-in status.
```

This helps another support person understand the workflow.

---

## Step 4 — Document Findings

Record what was found.

Example:

```text
Client IP address was valid.
DNS server was not pointing to the domain controller.
Client could ping the server IP but could not resolve the domain name.
```

Findings should be based on evidence from checks, not guesses.

---

## Step 5 — Document the Resolution

Write what fixed the issue.

Example:

```text
Updated the client DNS server to point to the domain controller. Confirmed domain name resolution worked after the change.
```

Keep the resolution clear and specific.

---

## Step 6 — Confirm the Result

Document the final test.

Example:

```text
Confirmed the client could resolve the domain name and access the shared folder successfully.
```

A ticket should not be closed until the result has been tested.

---

## Step 7 — Record Follow-Up Action

State whether follow-up is required.

Example:

```text
No further action required.
```

or:

```text
Monitor for recurrence and escalate if the issue returns.
```

---

## Step 8 — Final Case Note Example

```text
User reported that W11-CLIENT01 could not access domain resources. Checked network connection, IP configuration and DNS settings. The client had a valid IP address but DNS was not pointing to the domain controller. Updated the DNS setting to the domain controller IP and confirmed domain name resolution worked. User access to the shared folder was tested successfully. No further action required.
```

---

## Completion Checklist

- [ ] Issue summary written.
- [ ] User and device details recorded.
- [ ] Troubleshooting steps documented.
- [ ] Findings documented.
- [ ] Resolution documented.
- [ ] Final test result confirmed.
- [ ] Follow-up action recorded.
- [ ] Final case note reviewed for clarity.

---

## Key Takeaways

- Ticket notes should be factual and easy to follow.
- Troubleshooting steps should be written in order.
- A good case note includes the issue, checks, finding, resolution and confirmation.
- Clear documentation helps future support and escalation.

---

<p align="center">
  <a href="../15-network-troubleshooting-wifi-ip/README.md">Previous Lab</a> | <a href="../../README.md">Main README</a> | <a href="#top">Back to Top</a>
</p>
