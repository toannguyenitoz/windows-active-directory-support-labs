# Lab 03 - Network and DNS Configuration

This lab prepares network and DNS settings for the server and Windows 11 client.

## Objectives

- Configure a static IP address on the server.
- Set the client DNS server to the server IP address.
- Test basic network connectivity.
- Prepare the environment for domain setup.

## Suggested Lab Values

Server IP: `192.168.20.10`
Client IP: `192.168.20.101`
Subnet mask: `255.255.255.0`
DNS server: `192.168.20.10`

## Step-by-step Guide

1. On the server, open Network Connections.
2. Open the Ethernet adapter properties.
3. Open IPv4 properties.
4. Set the server IP address to `192.168.20.10`.
5. Set the server preferred DNS value to `192.168.20.10`.
6. On the client, open Network Connections.
7. Open IPv4 properties for the client adapter.
8. Set the client DNS value to `192.168.20.10`.
9. Test connectivity between the client and server.
10. Record the final IP and DNS settings.

## Verification Commands

- `ipconfig /all`
- `ping 192.168.20.10`

## Screenshot Files

- `01-server-ipv4-static-settings.png`
- `02-client-dns-server-settings.png`
- `03-server-ipconfig-after-static-ip.png`
- `04-client-ping-server.png`

## Completion Checklist

- [ ] Server static IP configured
- [ ] Client DNS points to server IP
- [ ] Client can reach the server
- [ ] Final IP settings recorded

[Previous Lab](../02-windows-server-initial-configuration/README.md) | [Main README](../../README.md) | [Next Lab](../04-active-directory-domain-services-setup/README.md)
