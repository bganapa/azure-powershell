---
external help file:
Module Name: Az.Network
online version: https://docs.microsoft.com/en-us/powershell/module/az.network/new-azfirewall
schema: 2.0.0
---

# New-AzFirewall

## SYNOPSIS
Creates or updates the specified Azure Firewall.

## SYNTAX

### CreateExpanded (Default)
```
New-AzFirewall -Name <String> -ResourceGroupName <String> [-SubscriptionId <String>]
 [-ApplicationRule <IAzureFirewallApplicationRuleCollection[]>] [-Id <String>]
 [-IPConfiguration <IAzureFirewallIPConfiguration[]>] [-Location <String>]
 [-NatRule <IAzureFirewallNatRuleCollection[]>] [-NetworkRule <IAzureFirewallNetworkRuleCollection[]>]
 [-Tag <Hashtable>] [-ThreatIntelligenceMode <AzureFirewallThreatIntelMode>] [-DefaultProfile <PSObject>]
 [-AsJob] [-NoWait] [-Confirm] [-WhatIf] [<CommonParameters>]
```

### Create
```
New-AzFirewall -Name <String> -ResourceGroupName <String> -Firewall <IAzureFirewall>
 [-SubscriptionId <String>] [-DefaultProfile <PSObject>] [-AsJob] [-NoWait] [-Confirm] [-WhatIf]
 [<CommonParameters>]
```

### CreateViaIdentity
```
New-AzFirewall -InputObject <INetworkIdentity> -Firewall <IAzureFirewall> [-DefaultProfile <PSObject>]
 [-AsJob] [-NoWait] [-Confirm] [-WhatIf] [<CommonParameters>]
```

### CreateViaIdentityExpanded
```
New-AzFirewall -InputObject <INetworkIdentity> [-ApplicationRule <IAzureFirewallApplicationRuleCollection[]>]
 [-Id <String>] [-IPConfiguration <IAzureFirewallIPConfiguration[]>] [-Location <String>]
 [-NatRule <IAzureFirewallNatRuleCollection[]>] [-NetworkRule <IAzureFirewallNetworkRuleCollection[]>]
 [-Tag <Hashtable>] [-ThreatIntelligenceMode <AzureFirewallThreatIntelMode>] [-DefaultProfile <PSObject>]
 [-AsJob] [-NoWait] [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Creates or updates the specified Azure Firewall.

## EXAMPLES

### Example 1: {{ Add title here }}
```powershell
PS C:\> {{ Add code here }}

{{ Add output here }}
```

{{ Add description here }}

### Example 2: {{ Add title here }}
```powershell
PS C:\> {{ Add code here }}

{{ Add output here }}
```

{{ Add description here }}

## PARAMETERS

### -ApplicationRule
Collection of application rule collections used by Azure Firewall.
To construct, see NOTES section for APPLICATIONRULE properties and create a hash table.

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.Network.Models.Api20190201.IAzureFirewallApplicationRuleCollection[]
Parameter Sets: CreateExpanded, CreateViaIdentityExpanded
Aliases: ApplicationRuleCollection

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -AsJob
Run the command as a job

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -DefaultProfile
The credentials, account, tenant, and subscription used for communication with Azure.

```yaml
Type: System.Management.Automation.PSObject
Parameter Sets: (All)
Aliases: AzureRMContext, AzureCredential

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -Firewall
Azure Firewall resource
To construct, see NOTES section for FIREWALL properties and create a hash table.

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.Network.Models.Api20190201.IAzureFirewall
Parameter Sets: Create, CreateViaIdentity
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
Dynamic: False
```

### -Id
Resource ID.

```yaml
Type: System.String
Parameter Sets: CreateExpanded, CreateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -InputObject
Identity Parameter
To construct, see NOTES section for INPUTOBJECT properties and create a hash table.

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.Network.Models.INetworkIdentity
Parameter Sets: CreateViaIdentity, CreateViaIdentityExpanded
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
Dynamic: False
```

### -IPConfiguration
IP configuration of the Azure Firewall resource.
To construct, see NOTES section for IPCONFIGURATION properties and create a hash table.

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.Network.Models.Api20190201.IAzureFirewallIPConfiguration[]
Parameter Sets: CreateExpanded, CreateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -Location
Resource location.

```yaml
Type: System.String
Parameter Sets: CreateExpanded, CreateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -Name
The name of the Azure Firewall.

```yaml
Type: System.String
Parameter Sets: Create, CreateExpanded
Aliases: AzureFirewallName

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -NatRule
Collection of NAT rule collections used by Azure Firewall.
To construct, see NOTES section for NATRULE properties and create a hash table.

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.Network.Models.Api20190201.IAzureFirewallNatRuleCollection[]
Parameter Sets: CreateExpanded, CreateViaIdentityExpanded
Aliases: NatRuleCollection

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -NetworkRule
Collection of network rule collections used by Azure Firewall.
To construct, see NOTES section for NETWORKRULE properties and create a hash table.

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.Network.Models.Api20190201.IAzureFirewallNetworkRuleCollection[]
Parameter Sets: CreateExpanded, CreateViaIdentityExpanded
Aliases: NetworkRuleCollection

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -NoWait
Run the command asynchronously

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ResourceGroupName
The name of the resource group.

```yaml
Type: System.String
Parameter Sets: Create, CreateExpanded
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -SubscriptionId
The subscription credentials which uniquely identify the Microsoft Azure subscription.
The subscription ID forms part of the URI for every service call.

```yaml
Type: System.String
Parameter Sets: Create, CreateExpanded
Aliases:

Required: False
Position: Named
Default value: (Get-AzContext).Subscription.Id
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -Tag
Resource tags.

```yaml
Type: System.Collections.Hashtable
Parameter Sets: CreateExpanded, CreateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ThreatIntelligenceMode
The operation mode for Threat Intelligence.

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.Network.Support.AzureFirewallThreatIntelMode
Parameter Sets: CreateExpanded, CreateViaIdentityExpanded
Aliases: ThreatIntelMode

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Microsoft.Azure.PowerShell.Cmdlets.Network.Models.Api20190201.IAzureFirewall

### Microsoft.Azure.PowerShell.Cmdlets.Network.Models.INetworkIdentity

## OUTPUTS

### Microsoft.Azure.PowerShell.Cmdlets.Network.Models.Api20190201.IAzureFirewall

## ALIASES

## NOTES

### COMPLEX PARAMETER PROPERTIES
To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

#### APPLICATIONRULE <IAzureFirewallApplicationRuleCollection[]>: Collection of application rule collections used by Azure Firewall.
  - `[Id <String>]`: Resource ID.
  - `[ActionType <AzureFirewallRcActionType?>]`: The type of action.
  - `[Name <String>]`: Gets name of the resource that is unique within a resource group. This name can be used to access the resource.
  - `[Priority <Int32?>]`: Priority of the application rule collection resource.
  - `[Rule <IAzureFirewallApplicationRule[]>]`: Collection of rules used by a application rule collection.
    - `[Description <String>]`: Description of the rule.
    - `[FqdnTag <String[]>]`: List of FQDN Tags for this rule.
    - `[Name <String>]`: Name of the application rule.
    - `[Protocol <IAzureFirewallApplicationRuleProtocol[]>]`: Array of ApplicationRuleProtocols.
      - `[Port <Int32?>]`: Port number for the protocol, cannot be greater than 64000. This field is optional.
      - `[ProtocolType <AzureFirewallApplicationRuleProtocolType?>]`: Protocol type
    - `[SourceAddress <String[]>]`: List of source IP addresses for this rule.
    - `[TargetFqdn <String[]>]`: List of FQDNs for this rule.

#### FIREWALL <IAzureFirewall>: Azure Firewall resource
  - `[Id <String>]`: Resource ID.
  - `[Location <String>]`: Resource location.
  - `[Tag <IResourceTags>]`: Resource tags.
    - `[(Any) <String>]`: This indicates any property can be added to this object.

#### INPUTOBJECT <INetworkIdentity>: Identity Parameter
  - `[ApplicationGatewayName <String>]`: The name of the application gateway.
  - `[ApplicationSecurityGroupName <String>]`: The name of the application security group.
  - `[AuthorizationName <String>]`: The name of the authorization.
  - `[AzureFirewallName <String>]`: The name of the Azure Firewall.
  - `[BackendAddressPoolName <String>]`: The name of the backend address pool.
  - `[CircuitName <String>]`: The name of the express route circuit.
  - `[ConnectionMonitorName <String>]`: The name of the connection monitor.
  - `[ConnectionName <String>]`: The name of the vpn connection.
  - `[CrossConnectionName <String>]`: The name of the ExpressRouteCrossConnection (service key of the circuit).
  - `[DdosCustomPolicyName <String>]`: The name of the DDoS custom policy.
  - `[DdosProtectionPlanName <String>]`: The name of the DDoS protection plan.
  - `[DefaultSecurityRuleName <String>]`: The name of the default security rule.
  - `[DevicePath <String>]`: The path of the device.
  - `[ExpressRouteGatewayName <String>]`: The name of the ExpressRoute gateway.
  - `[ExpressRoutePortName <String>]`: The name of the ExpressRoutePort resource.
  - `[FrontendIPConfigurationName <String>]`: The name of the frontend IP configuration.
  - `[GatewayName <String>]`: The name of the gateway.
  - `[IPConfigurationName <String>]`: The name of the ip configuration name.
  - `[Id <String>]`: Resource identity path
  - `[InboundNatRuleName <String>]`: The name of the inbound nat rule.
  - `[InterfaceEndpointName <String>]`: The name of the interface endpoint.
  - `[LinkName <String>]`: The name of the ExpressRouteLink resource.
  - `[LoadBalancerName <String>]`: The name of the load balancer.
  - `[LoadBalancingRuleName <String>]`: The name of the load balancing rule.
  - `[LocalNetworkGatewayName <String>]`: The name of the local network gateway.
  - `[Location <String>]`: The location of the subnet.
  - `[LocationName <String>]`: Name of the requested ExpressRoutePort peering location.
  - `[NatGatewayName <String>]`: The name of the nat gateway.
  - `[NetworkInterfaceName <String>]`: The name of the network interface.
  - `[NetworkProfileName <String>]`: The name of the NetworkProfile.
  - `[NetworkWatcherName <String>]`: The name of the network watcher.
  - `[NsgName <String>]`: The name of the network security group.
  - `[OutboundRuleName <String>]`: The name of the outbound rule.
  - `[P2SVpnServerConfigurationName <String>]`: The name of the P2SVpnServerConfiguration.
  - `[PacketCaptureName <String>]`: The name of the packet capture session.
  - `[PeeringName <String>]`: The name of the peering.
  - `[PolicyName <String>]`: The name of the policy
  - `[PredefinedPolicyName <String>]`: Name of Ssl predefined policy.
  - `[ProbeName <String>]`: The name of the probe.
  - `[PublicIPAddressName <String>]`: The name of the subnet.
  - `[PublicIPPrefixName <String>]`: The name of the PublicIpPrefix.
  - `[ResourceGroupName <String>]`: The name of the resource group.
  - `[RouteFilterName <String>]`: The name of the route filter.
  - `[RouteName <String>]`: The name of the route.
  - `[RouteTableName <String>]`: The name of the route table.
  - `[RuleName <String>]`: The name of the rule.
  - `[SecurityRuleName <String>]`: The name of the security rule.
  - `[ServiceEndpointPolicyDefinitionName <String>]`: The name of the service endpoint policy definition.
  - `[ServiceEndpointPolicyName <String>]`: The name of the service endpoint policy.
  - `[SubnetName <String>]`: The name of the subnet.
  - `[SubscriptionId <String>]`: The subscription credentials which uniquely identify the Microsoft Azure subscription. The subscription ID forms part of the URI for every service call.
  - `[TapConfigurationName <String>]`: The name of the tap configuration.
  - `[TapName <String>]`: The name of the virtual network tap.
  - `[VirtualHubName <String>]`: The name of the VirtualHub.
  - `[VirtualMachineScaleSetName <String>]`: The name of the virtual machine scale set.
  - `[VirtualWanName <String>]`: The name of the VirtualWAN being retrieved.
  - `[VirtualWanName1 <String>]`: The name of the VirtualWAN for which configuration of all vpn-sites is needed.
  - `[VirtualWanName2 <String>]`: The name of the VirtualWan.
  - `[VirtualmachineIndex <String>]`: The virtual machine index.
  - `[VnetGatewayConnectionName <String>]`: The name of the virtual network gateway connection for which the configuration script is generated.
  - `[VnetGatewayName <String>]`: The name of the virtual network gateway.
  - `[VnetName <String>]`: The name of the virtual network.
  - `[VnetPeeringName <String>]`: The name of the virtual network peering.
  - `[VpnSiteName <String>]`: The name of the VpnSite being retrieved.

#### IPCONFIGURATION <IAzureFirewallIPConfiguration[]>: IP configuration of the Azure Firewall resource.
  - `[Id <String>]`: Resource ID.
  - `[Name <String>]`: Name of the resource that is unique within a resource group. This name can be used to access the resource.
  - `[PublicIPAddressId <String>]`: Resource ID.
  - `[SubnetId <String>]`: Resource ID.

#### NATRULE <IAzureFirewallNatRuleCollection[]>: Collection of NAT rule collections used by Azure Firewall.
  - `[Id <String>]`: Resource ID.
  - `[ActionType <AzureFirewallNatRcActionType?>]`: The type of action.
  - `[Name <String>]`: Gets name of the resource that is unique within a resource group. This name can be used to access the resource.
  - `[Priority <Int32?>]`: Priority of the NAT rule collection resource.
  - `[Rule <IAzureFirewallNatRule[]>]`: Collection of rules used by a NAT rule collection.
    - `[Description <String>]`: Description of the rule.
    - `[DestinationAddress <String[]>]`: List of destination IP addresses for this rule. Supports IP ranges, prefixes, and service tags.
    - `[DestinationPort <String[]>]`: List of destination ports.
    - `[Name <String>]`: Name of the NAT rule.
    - `[Protocol <AzureFirewallNetworkRuleProtocol[]>]`: Array of AzureFirewallNetworkRuleProtocols applicable to this NAT rule.
    - `[SourceAddress <String[]>]`: List of source IP addresses for this rule.
    - `[TranslatedAddress <String>]`: The translated address for this NAT rule.
    - `[TranslatedPort <String>]`: The translated port for this NAT rule.

#### NETWORKRULE <IAzureFirewallNetworkRuleCollection[]>: Collection of network rule collections used by Azure Firewall.
  - `[Id <String>]`: Resource ID.
  - `[ActionType <AzureFirewallRcActionType?>]`: The type of action.
  - `[Name <String>]`: Gets name of the resource that is unique within a resource group. This name can be used to access the resource.
  - `[Priority <Int32?>]`: Priority of the network rule collection resource.
  - `[Rule <IAzureFirewallNetworkRule[]>]`: Collection of rules used by a network rule collection.
    - `[Description <String>]`: Description of the rule.
    - `[DestinationAddress <String[]>]`: List of destination IP addresses.
    - `[DestinationPort <String[]>]`: List of destination ports.
    - `[Name <String>]`: Name of the network rule.
    - `[Protocol <AzureFirewallNetworkRuleProtocol[]>]`: Array of AzureFirewallNetworkRuleProtocols.
    - `[SourceAddress <String[]>]`: List of source IP addresses for this rule.

## RELATED LINKS

