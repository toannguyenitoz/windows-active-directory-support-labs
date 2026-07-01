# Command Reference

Useful commands used across the Windows and Active Directory labs.

## Windows Client Commands

```cmd
hostname
whoami
ipconfig
ipconfig /all
ipconfig /release
ipconfig /renew
ipconfig /flushdns
ping 192.168.20.10
ping corp.local
nslookup corp.local
winver
systeminfo
```

## PowerShell Commands

```powershell
Get-ComputerInfo
Get-NetIPConfiguration
Get-DnsClientServerAddress
Test-Connection 192.168.20.10
Resolve-DnsName corp.local
```

## Active Directory PowerShell Commands

```powershell
Get-ADDomain
Get-ADUser -Filter *
Get-ADGroup -Filter *
Get-ADComputer -Filter *
Get-ADOrganizationalUnit -Filter *
```

## Group Policy Commands

```cmd
gpupdate /force
gpresult /r
```

## Remote Desktop Command

```cmd
mstsc
```

## File Share Checks

Use File Explorer to open the server share path and confirm the expected folders are visible.
