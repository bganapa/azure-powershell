---
external help file:
Module Name: Az.Monitor
online version: https://docs.microsoft.com/en-us/powershell/module/az.monitor/get-azalertrule
schema: 2.0.0
---

# Get-AzAlertRule

## SYNOPSIS
Gets an alert rule

## SYNTAX

### List1 (Default)
```
Get-AzAlertRule [-SubscriptionId <String[]>] [-DefaultProfile <PSObject>] [<CommonParameters>]
```

### ByTargetId
```
Get-AzAlertRule -ResourceGroupName <String> -TargetResourceId <String> [-SubscriptionId <String[]>]
 [-DefaultProfile <PSObject>] [<CommonParameters>]
```

### Get
```
Get-AzAlertRule -Name <String> -ResourceGroupName <String> [-SubscriptionId <String[]>]
 [-DefaultProfile <PSObject>] [<CommonParameters>]
```

### GetViaIdentity
```
Get-AzAlertRule -InputObject <IMonitorIdentity> [-DefaultProfile <PSObject>] [<CommonParameters>]
```

### List
```
Get-AzAlertRule -ResourceGroupName <String> [-SubscriptionId <String[]>] [-DefaultProfile <PSObject>]
 [<CommonParameters>]
```

## DESCRIPTION
Gets an alert rule

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

### -InputObject
Identity Parameter
To construct, see NOTES section for INPUTOBJECT properties and create a hash table.

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.Monitor.Models.IMonitorIdentity
Parameter Sets: GetViaIdentity
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
Dynamic: False
```

### -Name
The name of the rule.

```yaml
Type: System.String
Parameter Sets: Get
Aliases:

Required: True
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
Parameter Sets: ByTargetId, Get, List
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -SubscriptionId
The Azure subscription Id.

```yaml
Type: System.String[]
Parameter Sets: ByTargetId, Get, List, List1
Aliases:

Required: False
Position: Named
Default value: (Get-AzContext).Subscription.Id
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -TargetResourceId
The alert rule target resource id

```yaml
Type: System.String
Parameter Sets: ByTargetId
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Microsoft.Azure.PowerShell.Cmdlets.Monitor.Models.IMonitorIdentity

## OUTPUTS

### Microsoft.Azure.PowerShell.Cmdlets.Monitor.Models.Api20160301.IAlertRuleResource

## ALIASES

## NOTES

### COMPLEX PARAMETER PROPERTIES
To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

#### INPUTOBJECT <IMonitorIdentity>: Identity Parameter
  - `[ActionGroupName <String>]`: The name of the action group.
  - `[ActivityLogAlertName <String>]`: The name of the activity log alert.
  - `[AutoscaleSettingName <String>]`: The autoscale setting name.
  - `[Id <String>]`: Resource identity path
  - `[IncidentName <String>]`: The name of the incident to retrieve.
  - `[LogProfileName <String>]`: The name of the log profile.
  - `[MetricName <String>]`: The name of the metric to retrieve the baseline for.
  - `[Name <String>]`: The name of the diagnostic setting.
  - `[ResourceGroupName <String>]`: The name of the resource group.
  - `[ResourceName <String>]`: The ARM resource name
  - `[ResourceProvider <String>]`: The ARM resource provider name
  - `[ResourceTypeName <String>]`: The ARM resource type name
  - `[ResourceUri <String>]`: The identifier of the resource.
  - `[RuleName <String>]`: The name of the rule.
  - `[StatusName <String>]`: The name of the status.
  - `[SubscriptionId <String>]`: The Azure subscription Id.

## RELATED LINKS

