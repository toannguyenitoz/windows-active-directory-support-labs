# Lab 15 - Network Troubleshooting Wi-Fi and IP

## Overview

This lab practices common network troubleshooting checks for IT Support.

## Objectives

- Check IP configuration.
- Test connectivity.
- Review DNS settings.
- Identify whether the issue is local device, network, or name resolution related.

## Steps

1. Confirm whether the device is connected by Wi-Fi or Ethernet.
2. Check the network icon status.
3. Open Command Prompt.
4. Run `ipconfig`.
5. Run `ipconfig /all`.
6. Check IPv4 address, default gateway and DNS server.
7. Test ping to the default gateway.
8. Test ping to the server.
9. Test name lookup for the lab domain.
10. Record the troubleshooting result.

## Useful Commands

- `ipconfig`
- `ipconfig /all`
- `ipconfig /flushdns`
- `ping 192.168.20.10`
- `nslookup corp.local`

## Screenshot Files

- `01-network-status-icon.png`
- `02-ipconfig-output.png`
- `03-ping-default-gateway.png`
- `04-ping-server.png`
- `05-dns-lookup-test.png`

## Checklist

- [ ] Connection type confirmed
- [ ] IP configuration checked
- [ ] Gateway test completed
- [ ] Server connectivity tested
- [ ] DNS lookup tested

[Previous Lab](../14-remote-desktop-support/README.md) | [Main README](../../README.md) | [Next Lab](../16-service-desk-documentation/README.md)
