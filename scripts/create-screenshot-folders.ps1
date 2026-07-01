$folders = @(
  'assets/images/lab-01-windows-11-client-initial-configuration',
  'assets/images/lab-02-windows-server-initial-configuration',
  'assets/images/lab-03-network-and-dns-configuration',
  'assets/images/lab-04-active-directory-domain-services-setup',
  'assets/images/lab-05-join-windows-11-client-to-domain',
  'assets/images/lab-06-active-directory-ou-structure',
  'assets/images/lab-07-active-directory-user-management',
  'assets/images/lab-08-active-directory-group-management',
  'assets/images/lab-09-password-lockout-logon-controls',
  'assets/images/lab-10-home-folder-and-file-share',
  'assets/images/lab-11-rsat-remote-administration',
  'assets/images/lab-12-second-client-computer-management',
  'assets/images/lab-13-print-server-and-network-printer',
  'assets/images/lab-14-remote-desktop-support',
  'assets/images/lab-15-network-troubleshooting-wifi-ip',
  'assets/images/lab-16-service-desk-documentation'
)

foreach ($folder in $folders) {
  New-Item -ItemType Directory -Force $folder | Out-Null
  New-Item -ItemType File -Force (Join-Path $folder '.gitkeep') | Out-Null
}

Write-Host 'Screenshot folders created.'
