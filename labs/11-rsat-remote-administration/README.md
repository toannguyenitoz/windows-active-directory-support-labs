# Lab 11 - RSAT Remote Administration

## Overview

This lab uses Remote Server Administration Tools from the Windows 11 client to manage server features remotely.

## Objectives

- Install or enable RSAT tools on Windows 11.
- Open Active Directory Users and Computers from the client.
- Confirm remote administration access.
- Manage a test Active Directory object from the client.

## Steps

1. Sign in to the Windows 11 client with a domain account that has permission to manage Active Directory.
2. Open Settings.
3. Go to Optional Features.
4. Add RSAT tools for Active Directory.
5. Open Windows Tools.
6. Launch Active Directory Users and Computers.
7. Connect to the lab domain if prompted.
8. Browse the OU structure.
9. Open a test user or group object.
10. Make a small lab-safe change, such as updating a description field.
11. Confirm the change appears on the server as well.

## Verification

Check that Active Directory Users and Computers opens from the Windows 11 client and displays the lab domain.

## Screenshot Files

- `01-add-optional-feature-rsat.png`
- `02-rsat-tools-installed.png`
- `03-open-aduc-from-client.png`
- `04-browse-domain-from-client.png`
- `05-update-object-description.png`

## Checklist

- [ ] RSAT tools installed or enabled
- [ ] ADUC opened from client
- [ ] Domain visible from client
- [ ] Test object reviewed
- [ ] Remote admin task confirmed

[Previous Lab](../10-home-folder-and-file-share/README.md) | [Main README](../../README.md) | [Next Lab](../12-second-client-computer-management/README.md)
