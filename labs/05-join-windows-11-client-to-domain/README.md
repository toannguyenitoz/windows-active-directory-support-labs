# Lab 05 - Join Windows 11 Client to Domain

## Overview

This lab joins the Windows 11 client to the lab domain.

## Objectives

- Confirm DNS is pointing to the server.
- Join the client to `corp.local`.
- Restart the client.
- Confirm the computer appears in Active Directory.

## Steps

1. On the client, confirm the DNS server is the server IP address.
2. Open Settings > System > About.
3. Open advanced domain or workgroup settings.
4. Choose the option to join a domain.
5. Enter `corp.local`.
6. Enter a domain account with permission to join computers.
7. Restart the client when prompted.
8. Sign in using a domain account.
9. On the server, open Active Directory Users and Computers and confirm the computer object exists.

## Checks

Run `hostname`, `ipconfig /all` and `echo %USERDOMAIN%`.

## Screenshot Files

- `01-client-dns-before-domain-join.png`
- `02-join-domain-corp-local.png`
- `03-domain-join-success.png`
- `04-domain-login-screen.png`
- `05-computer-object-in-active-directory.png`

## Checklist

- [ ] Client DNS checked
- [ ] Client joined to domain
- [ ] Client restarted
- [ ] Domain sign-in tested
- [ ] Computer object confirmed

[Previous Lab](../04-active-directory-domain-services-setup/README.md) | [Main README](../../README.md) | [Next Lab](../06-active-directory-ou-structure/README.md)
