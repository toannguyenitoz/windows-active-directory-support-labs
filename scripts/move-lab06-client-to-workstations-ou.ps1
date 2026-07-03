<#
.SYNOPSIS
    Moves the Lab 05 Windows 11 client computer object into the Lab 06 Workstations OU.

.DESCRIPTION
    This script moves W11-CLIENT01 from its current Active Directory location
    into:

    AdelaideTechSolutions > Computers > Workstations

    It is safe to run more than once. If the computer is already in the target OU,
    the script reports that no move is required.

.RUN ON
    Domain Controller: SRV-DC01

.EXAMPLE
    .\move-lab06-client-to-workstations-ou.ps1

.EXAMPLE
    .\move-lab06-client-to-workstations-ou.ps1 -ComputerName "W11-CLIENT01"
#>

[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [string]$CompanyOU = "AdelaideTechSolutions",
    [string]$ComputerName = "W11-CLIENT01"
)

Import-Module ActiveDirectory -ErrorAction Stop

$DomainDN = (Get-ADDomain).DistinguishedName
$TargetOU = "OU=Workstations,OU=Computers,OU=$CompanyOU,$DomainDN"

Write-Host ""
Write-Host "Lab 06 - Move Client Computer to Workstations OU" -ForegroundColor Cyan
Write-Host "Computer: $ComputerName" -ForegroundColor Cyan
Write-Host "Target OU: $TargetOU" -ForegroundColor Cyan
Write-Host ""

$Computer = Get-ADComputer -Identity $ComputerName -Properties DistinguishedName -ErrorAction Stop
$TargetExists = Get-ADOrganizationalUnit -Identity $TargetOU -ErrorAction SilentlyContinue

if (-not $TargetExists) {
    Write-Host "Target OU does not exist: $TargetOU" -ForegroundColor Red
    Write-Host "Run create-lab06-ou-structure.ps1 first." -ForegroundColor Yellow
    return
}

if ($Computer.DistinguishedName -like "CN=$ComputerName,$TargetOU") {
    Write-Host "No action required. $ComputerName is already in the Workstations OU." -ForegroundColor Yellow
}
else {
    if ($PSCmdlet.ShouldProcess($Computer.DistinguishedName, "Move to $TargetOU")) {
        Move-ADObject -Identity $Computer.DistinguishedName -TargetPath $TargetOU -ErrorAction Stop
        Write-Host "Moved $ComputerName to the Workstations OU." -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "Current computer object location:" -ForegroundColor Cyan
Get-ADComputer -Identity $ComputerName -Properties DistinguishedName |
    Select-Object Name, DistinguishedName |
    Format-List
