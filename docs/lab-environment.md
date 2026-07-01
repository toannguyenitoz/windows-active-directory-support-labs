# Lab Environment

## Recommended Machines

| Machine | Purpose | Example Name |
|---|---|---|
| Windows Server | Domain Controller, DNS, file and print services | `SRV-DC01` |
| Windows 11 Client 1 | Primary workstation | `W11-CLIENT01` |
| Windows 11 Client 2 | Second workstation for testing | `W11-CLIENT02` |

## Example Network

| Item | Example Value |
|---|---|
| Network | `192.168.20.0/24` |
| Domain Controller IP | `192.168.20.10` |
| Client 1 IP | `192.168.20.101` |
| Client 2 IP | `192.168.20.102` |
| Subnet Mask | `255.255.255.0` |
| DNS Server | `192.168.20.10` |
| Domain | `corp.local` |

## Naming Standard

| Object | Naming Example |
|---|---|
| Server | `SRV-DC01` |
| Client | `W11-CLIENT01` |
| Global Group | `GG_ITSupport` |
| Domain Local Group | `DL_FileShare_Read` |
| User | `j.smith` |

## Safety Notes

- Use a lab environment only.
- Do not publish real passwords.
- Do not publish internal business information.
- Replace examples with your own safe lab values where required.
