# Lab 02 - Windows Server Initial Configuration

This lab prepares a Windows Server machine for a small workplace-style network.

## Objectives

- Check Windows Server information.
- Rename the server.
- Configure basic power and remote settings.
- Confirm network adapter details.
- Prepare the server for DNS and Active Directory roles.

## Suggested Lab Values

Server name: `SRV-DC01`

## Step-by-step Guide

1. Open Server Manager and confirm the server starts normally.
2. Open Local Server and review computer name, workgroup/domain, Remote Desktop, Ethernet and Windows Firewall status.
3. Rename the server to `SRV-DC01`.
4. Restart the server after the rename.
5. After restart, open Command Prompt and run `hostname` to confirm the new name.
6. Run `ipconfig /all` and record the current IPv4 address, DNS server and adapter name.
7. Open Settings or Control Panel and adjust sleep settings so the server does not sleep during lab work.
8. Review Remote Desktop settings and enable Remote Desktop if required for later support labs.

## Verification Commands

- `hostname`
- `ipconfig /all`
- `winver`

## Screenshot Files

- `01-server-manager-local-server.png`
- `02-rename-server-srv-dc01.png`
- `03-confirm-server-hostname.png`
- `04-server-ipconfig-before-static-ip.png`
- `05-remote-desktop-server-settings.png`

## Completion Checklist

- [ ] Server Manager opened
- [ ] Server renamed to `SRV-DC01`
- [ ] Server restarted successfully
- [ ] Hostname confirmed
- [ ] Network configuration reviewed
- [ ] Remote Desktop reviewed

[Previous Lab](../01-windows-11-client-initial-configuration/README.md) | [Main README](../../README.md) | [Next Lab](../03-network-and-dns-configuration/README.md)
