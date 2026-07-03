<#
.SYNOPSIS
    Verifies the Lab 06 Active Directory OU structure.

.DESCRIPTION
    This script checks whether the expected AdelaideTechSolutions OU structure
    exists in Active Directory and prints a clear PASS / MISSING report.

.RUN ON
    Domain Controller: SRV-DC01

.EXAMPLE
    .\verify-lab06-ou-structure.ps1
#>

[CmdletBinding()]
param(
    [string]$CompanyOU = "AdelaideTechSolutions"
)

Import-Module ActiveDirectory -ErrorAction Stop

$DomainDN = (Get-ADDomain).DistinguishedName
$CompanyPath = "OU=$CompanyOU,$DomainDN"

$ExpectedOUs = @(
    $CompanyPath,
    "OU=Users,$CompanyPath",
    "OU=Computers,$CompanyPath",
    "OU=Groups,$CompanyPath",
    "OU=ServiceAccounts,$CompanyPath",
    "OU=Departments,$CompanyPath",
    "OU=IT,OU=Departments,$CompanyPath",
    "OU=HR,OU=Departments,$CompanyPath",
    "OU=Finance,OU=Departments,$CompanyPath",
    "OU=Sales,OU=Departments,$CompanyPath",
    "OU=Operations,OU=Departments,$CompanyPath",
    "OU=StandardUsers,OU=Users,$CompanyPath",
    "OU=AdminUsers,OU=Users,$CompanyPath",
    "OU=DisabledUsers,OU=Users,$CompanyPath",
    "OU=Workstations,OU=Computers,$CompanyPath",
    "OU=Servers,OU=Computers,$CompanyPath",
    "OU=Laptops,OU=Computers,$CompanyPath",
    "OU=SecurityGroups,OU=Groups,$CompanyPath",
    "OU=DistributionGroups,OU=Groups,$CompanyPath"
)

Write-Host ""
Write-Host "Lab 06 - Verify Active Directory OU Structure" -ForegroundColor Cyan
Write-Host "Domain DN: $DomainDN" -ForegroundColor Cyan
Write-Host "Company OU: $CompanyOU" -ForegroundColor Cyan
Write-Host ""

$Report = foreach ($ouDN in $ExpectedOUs) {
    $ou = Get-ADOrganizationalUnit -Identity $ouDN -ErrorAction SilentlyContinue

    if ($ou) {
        [PSCustomObject]@{
            Status = "PASS"
            Name = $ou.Name
            DistinguishedName = $ou.DistinguishedName
        }
    }
    else {
        [PSCustomObject]@{
            Status = "MISSING"
            Name = ($ouDN -split ',')[0].Replace('OU=', '')
            DistinguishedName = $ouDN
        }
    }
}

$Report | Sort-Object Status, Name | Format-Table -AutoSize

$MissingCount = ($Report | Where-Object { $_.Status -eq "MISSING" }).Count

Write-Host ""
if ($MissingCount -eq 0) {
    Write-Host "Verification complete: all expected OUs exist." -ForegroundColor Green
}
else {
    Write-Host "Verification complete: $MissingCount OU(s) are missing." -ForegroundColor Red
    Write-Host "Run create-lab06-ou-structure.ps1 again, then re-run this verification script." -ForegroundColor Yellow
}
