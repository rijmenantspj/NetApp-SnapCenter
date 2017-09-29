[CmdletBinding()]
Param(
	[Parameter(Mandatory=$True)]
	[string]$SnapCenter
)

New-NetFirewallRule -DisplayName "SnapCenter (SMCore HTTP Communication Port)" -Action Allow -Direction Inbound -Enabled True -Profile Any -Protocol TCP -LocalPort 8145 -Group "NetApp SnapCenter" -RemoteAddress $SnapCenter
New-NetFirewallRule -DisplayName "SnapCenter (NetBios)" -Action Allow -Direction Inbound -Enabled True -Profile Any -Protocol UDP -LocalPort 137 -Group "NetApp SnapCenter" -RemoteAddress $SnapCenter
New-NetFirewallRule -DisplayName "SnapCenter (DCE/RPC)" -Action Allow -Direction Inbound -Enabled True -Profile Any -Protocol TCP -LocalPort 135 -Group "NetApp SnapCenter" -RemoteAddress $SnapCenter
New-NetFirewallRule -DisplayName "SnapCenter (SMB-In)" -Action Allow -Direction Inbound -Enabled True -Profile Any -Protocol TCP -LocalPort 445 -Group "NetApp SnapCenter" -RemoteAddress $SnapCenter
New-NetFirewallRule -DisplayName "SnapCenter (Background Intelligent Transfer Service [BITS])" -Action Allow -Direction Inbound -Enabled True -Profile Any -Service BITS -Group "NetApp SnapCenter" -RemoteAddress $SnapCenter
