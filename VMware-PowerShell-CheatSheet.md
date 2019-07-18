
# VMWare PowerShell CheatSheet

## Load VMware Core Snapin

`Add-PSSnapin VMware.VimAutomation.Core`

## Load VMware VDS Snapin

`Add-PSSnapin VMware.VimAutomation.Vds`

## Load VMware ImageBuilder Snapin

`Add-PSSnapin VMware.ImageBuilder`

## Load VST.Utility Module:

`Import-Module \\vst\PSModules\VST.Utility`

## Load XtremIO.Util Module

`Import-Module \\vst\PSModules\XtremIO.Util`s

## Gather esxcli information from host

`$esxcli = Get-EsxCli -VMHost dev0dusty.am.lilly.com`

## Report Cluster VLAN Details

`Get-Cluster Sweets | Get-VMHost -State Connected | Get-Random | Get-VirtualPortGroup | Select Name`

## Review vmDeploy log file (Need to have VST.Utility module loaded)

`Get-VSTVMDeployLog -env dev pocvsan-vm-01`

## Get Random VMHost from Cluster that is in a connected state

`Get-Cluster GameOfThrones | Get-VMHost | ?{$_.ConnectionState -eq "Connected"} | Get-Random`

## disconnect from all vCs, so as to avoid any duplicate reporting

`if (($global:DefaultVIServers | measure).Count -gt 0) {Disconnect-VIServer * -Confirm:$false -ErrorAction:SilentlyContinue}`

## Using where function in query

`Get-Cluster Oceania | Get-VM | where {$_.Name -like "pocose*"}`

## Finding mac and ip addresses for VM's

`Get-Cluster SuperSaiyans | Get-VM | Where {$_.Name -like "ioanalyzer*"} | Get-NetworkAdapter | Select Parent,MacAddress | Sort Parent | ft -auto`
`Get-Cluster SuperSaiyans | Get-VM | Where {$_.Name -like "ioanalyzer*"} | Select Name, @{N="IP";E={@($_.Guest.IPAddress)}} | ft -auto`

## Find snapshots

`Get-Cluster Oceania | get-vm | get-snapshot | select vm, name, description, created, sizegb | ft -autosize`
`Get-VM | where {$_.Name -like "ose*"} | Select-Object -Property Name,VMHost,@{Name='Cluster';Expression={$_.VMHost.Parent}} | ft -auto`
`Get-VM | where {$_.Name -like "ose*"} | Select-Object -Property Name,NumCpu,MemoryGB,VMHost,@{Name='Cluster';Expression={$_.VMHost.Parent}} | ft -auto`
`Get-VM | Select-Object Name,@{n="HardDiskSizeGB"; e={(Get-HardDisk -VM $_ | Measure-Object -Sum CapacityGB).Sum}}`
`Get-VM | where {$_.Name -like "ose*"} | Select-Object Name,@{n="HardDiskSizeGB"; e={(Get-HardDisk -VM $_ | Measure-Object -Sum CapacityGB).Sum}}`
`Get-VM | where {$_.Name -like "ose*"} | Select-Object Name,NumCpu,MemoryGB,@{n="HardDiskSizeGB"; e={(Get-HardDisk -VM $_ | Measure-Object -Sum CapacityGB).Sum}},VMHost,@{Name='Cluster';Expression={$_.VMHost.Parent}} | ft -auto`

## Hash example

```
$SPGs = @{
	"100.Private" = "100.Private_SPG";
	"161.F5Internal.TestDev" = "161.F5Internal.TestDev_SPG";
	"215.DCS.LBTBD" = "215.DCS.LBTBD_SPG";
	"216.DCS.LBTBD" = "216.DCS.LBTBD_SPG";
	"219.DCS.LBRIB" = "219.DCS.LBRIB_SPG";
	"3910.F5HA.TestDev" = "3910.F5HA.TestDev_SPG";
	"VLAN31" = "VLAN31_SPG";
	"VLAN32" = "VLAN32_SPG";
	"VLAN33" = "VLAN33_SPG";
	"VLAN36" = "VLAN36_SPG";
	"VLAN39" = "VLAN39_SPG";
};
```

```
$SPGs.Keys | % {
     $OldSPGName = $_
     $NewSPGName = $SPGs.Item($_)
     Get-VMhost -name $VMhost | Get-VirtualSwitch -Name $vSS | Get-VirtualPortGroup -Name $OldSPGName | Set-VirtualPortGroup -Name $NewSPGName
}
```

```
Foreach ($vmhost in (get-vmhost))
{
 $vswitch3 =  New-VirtualSwitch -VMHost $vmhost -Name vSwitch2 -Nic vmnic2,vmnic3
 New-VirtualPortGroup -VirtualSwitch $vswitch3  -Name VLAN12  -VLanID 12
 New-VirtualPortGroup -VirtualSwitch $vswitch3  -Name VLAN13  -VLanID 13
 New-VirtualPortGroup -VirtualSwitch $vswitch3  -Name VLAN14  -VLanID 14
 New-VirtualPortGroup -VirtualSwitch $vswitch3  -Name VLAN15  -VLanID 15
}
```

```
Import-CSV vmhosts.csv | ForEach-Object {
$hostname = $_.vmhost
$ipstorage0 = $_.storage0ip
$ipstorage1 = $_.storage1ip
 $vswitch4 =  New-VirtualSwitch -VMHost $hostname -Name vSwitch4 -Nic vmnic2,vmnic3
 New-VMHostNetworkAdapter -VMHost $hostname -VirtualSwitch $vswitch4 -PortGroup IP-Storage0 -IP $ipstorage0 -SubnetMask 255.255.255.0
 New-VMHostNetworkAdapter -VMHost $hostname -VirtualSwitch $vswitch4 -PortGroup IP-Storage1 -IP $ipstorage1 -SubnetMask 255.255.255.0
 Get-VirtualPortGroup -VMHost $HostName -VirtualSwitch $vswitch4 -Name IP-Storage0 | Get-NicTeamingPolicy | Set-NicTeamingPolicy -MakeNicActive vmnic2 -MakeNicUnused vmnic3
 Get-VirtualPortGroup -VMHost $HostName -VirtualSwitch $vswitch4 -Name IP-Storage1 | Get-NicTeamingPolicy | Set-NicTeamingPolicy -MakeNicActive vmnic3 -MakeNicUnused vmnic2
}
```


`$objVMotionPG = Get-VirtualPortGroup -VMHost $objVMHostToBuild -Name $strVMoPortgroupName`

## Set proper VLAN on vMotion PortGroup

`Set-VirtualPortGroup -VirtualPortGroup $objVMotionPG -VLanId $intVMoVLanID -Confirm:$false`

## Set proper MTU on vMotion vSwitch

`Set-VirtualSwitch -VirtualSwitch $objVMotionPG.VirtualSwitch -Mtu $intMtu -Confirm:$false`

## Retrieve a list of VDPort Groups From a Host that are not Uplink Groups

`Get-Cluster Oceania | Get-VMHost -Name dev0yaren.am.lilly.com | Get-VDSwitch -Name DVS-GIS | Get-VDPortgroup | where {$_.IsUplink -eq $false} | Select Name, VlanConfiguration,PortBinding | ft -autosize`

## Retrieve Uplink TeamingPolicy configuration for all VPG in a VDS

`Get-Cluster Oceania | Get-VMHost -Name dev0yaren.am.lilly.com | Get-VDSwitch -Name DVS-GIS | Get-VDPortgroup | where {$_.IsUplink -eq $false}  | Get-VDUplinkTeamingPolicy | Select VDPortgroup,LoadBalancingPolicy,FailoverDetectionPolicy,NotifySwitches,FailBack | ft -autosize`

## Retrieve Uplink configuration for all VPGs in a VDS in use by a Cluster

`Get-Cluster Oceania | Get-VMHost -Name dev0yaren.am.lilly.com | Get-VDSwitch -Name DVS-GIS | Get-VDPortgroup | where {$_.IsUplink -eq $false}  | Get-VDUplinkTeamingPolicy | Select VDPortgroup,ActiveUplinkPort,StandbyUplinkPort,UnusedUplinkPort | ft -autosize`

## List all VMs and their Network Portgroup and Mac Address

`Get-VM | Get-NetworkAdapter | Select Parent, Name, NetworkName, MacAddress`
`Get-Cluster Oceania | Get-VM | Get-NetworkAdapter | Select Parent, Name, NetworkName, MacAddress | Where {$_.NetworkName -like "*_SPG"} | Select Parent, Name, NetworkName, MacAddress | Sort NetworkName`
`Get-Cluster Oceania | Get-VM | Get-NetworkAdapter | Select Parent, Name, NetworkName, MacAddress | Where {$_.NetworkName -like "*100.Private"} | Select Parent, Name, NetworkName, MacAddress | Sort NetworkName`
`Get-Cluster Oceania | Get-VM | Get-NetworkAdapter | Select Parent, Name, NetworkName, MacAddress | Where {$_.NetworkName -notlike "*.Oceania"} | Select Parent, Name, NetworkName, MacAddress | Sort NetworkName`

## Export the configuration of a specified port group to file

`Get-VDPortGroup -Name ‘DHCP01’ | Export-VDPortGroup -Destination ‘C:\MyVDSwitchesBackup\DHCP01BackupPG.zip’`

## List all Portgroups and their relevant information

`Get-VDPortgroup | Select Name, VirtualSwitch, Datacenter, VlanConfiguration, NumPorts, PortBinding`

## List the vSwitches and their main properties

`Get-VDSwitch | Select *`

## Create a new distributed port group on the specified vSphere distributed switch with the specified number of ports and VLAN ID

`Get-VDSwitch -Name “Test-VDS” | New-VDPortgroup -Name “PG_VLAN4” -NumPorts 8 -VLanId 4`

## Retrieve a list of Teaming Policy for Stand Switch Standard Port Groups

`Get-Cluster Oceania | Get-VMHost -Name dev0yaren.am.lilly.com | Get-VirtualPortGroup -VirtualSwitch vSwitch0 | Get-NicTeamingPolicy`

## Retrieve a list of Standard Switch configured within a vDC with vmnic assignment and VMHost assignment

 `Get-VirtualSwitch -Datacenter GIS -Standard | Select Name, Nic, VMHost | ft -autosize`

## Modify mgmt network to inherit vSwitch teamming defaults

 `Get-VirtualPortGroup -VMHost $objVMHostToBuild -Name "Management Network" | Get-NicTeamingPolicy | Set-NicTeamingPolicy -InheritLoadBalancingPolicy $true -InheritNetworkFailoverDetectionPolicy $true -InheritNotifySwitches $true -InheritFailback $true -InheritFailoverOrder $true`

```
 PS C:\pub> Get-Cluster Oceania | Get-VMHost -Name dev0yaren.am.lilly.com | Get-VirtualSwitch -Name vSwitch0 | Get-NicTeamingPolicy

 VirtualSwitch   ActiveNic       StandbyNic      UnusedNic       FailbackEnabled NotifySwitches
 -------------   ---------       ----------      ---------       --------------- --------------
 vSwitch0        {vmnic1}                                        True            True

 PS C:\pub> Get-Cluster Oceania | Get-VMHost -Name dev0yaren.am.lilly.com | Get-VirtualPortGroup -Name VLAN39_SPG | Get-NicTeamingPolicy

 VirtualPortGroup     ActiveNic       StandbyNic      UnusedNic       FailbackEnabled NotifySwitches
 ----------------     ---------       ----------      ---------       --------------- --------------
 VLAN39_SPG           {vmnic1}                                        True            True
```