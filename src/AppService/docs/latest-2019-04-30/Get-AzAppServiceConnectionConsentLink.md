---
external help file:
Module Name: Az.AppService
online version: https://docs.microsoft.com/en-us/powershell/module/az.appservice/get-azappserviceconnectionconsentlink
schema: 2.0.0
---

# Get-AzAppServiceConnectionConsentLink

## SYNOPSIS
Lists consent links of a connection.

## SYNTAX

### ListExpanded (Default)
```
Get-AzAppServiceConnectionConsentLink -ConnectionName <String> -ResourceGroupName <String> -Location <String>
 [-SubscriptionId <String[]>] [-Id <String>] [-Kind <String>] [-Name <String>]
 [-Parameter <IConsentLinkInputParameter[]>] [-Tag <Hashtable>] [-Type <String>] [-DefaultProfile <PSObject>]
 [-Confirm] [-WhatIf] [<CommonParameters>]
```

### List
```
Get-AzAppServiceConnectionConsentLink -ConnectionName <String> -ResourceGroupName <String>
 -Content <IConsentLinkInput> [-SubscriptionId <String[]>] [-DefaultProfile <PSObject>] [-Confirm] [-WhatIf]
 [<CommonParameters>]
```

## DESCRIPTION
Lists consent links of a connection.

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

### -ConnectionName
The connection name.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -Content
Connection Consent Link payload
To construct, see NOTES section for CONTENT properties and create a hash table.

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.AppService.Models.Api20150801Preview.IConsentLinkInput
Parameter Sets: List
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
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

### -Id
Resource Id

```yaml
Type: System.String
Parameter Sets: ListExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -Kind
Kind of resource

```yaml
Type: System.String
Parameter Sets: ListExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -Location
Resource Location

```yaml
Type: System.String
Parameter Sets: ListExpanded
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -Name
Resource Name

```yaml
Type: System.String
Parameter Sets: ListExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -Parameter
Array of links
To construct, see NOTES section for PARAMETER properties and create a hash table.

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.AppService.Models.Api20150801Preview.IConsentLinkInputParameter[]
Parameter Sets: ListExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ResourceGroupName
The resource group name.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -SubscriptionId
Your Azure subscription ID.
This is a GUID-formatted string (e.g.
00000000-0000-0000-0000-000000000000).

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: (Get-AzContext).Subscription.Id
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -Tag
Resource tags

```yaml
Type: System.Collections.Hashtable
Parameter Sets: ListExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -Type
Resource type

```yaml
Type: System.String
Parameter Sets: ListExpanded
Aliases:

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

### Microsoft.Azure.PowerShell.Cmdlets.AppService.Models.Api20150801Preview.IConsentLinkInput

## OUTPUTS

### Microsoft.Azure.PowerShell.Cmdlets.AppService.Models.Api20150801Preview.IConsentLink

## ALIASES

## NOTES

### COMPLEX PARAMETER PROPERTIES
To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

#### CONTENT <IConsentLinkInput>: Connection Consent Link payload
  - `Location <String>`: Resource Location
  - `[Id <String>]`: Resource Id
  - `[Kind <String>]`: Kind of resource
  - `[Name <String>]`: Resource Name
  - `[Tag <IResourceTags>]`: Resource tags
    - `[(Any) <String>]`: This indicates any property can be added to this object.
  - `[Type <String>]`: Resource type
  - `[Parameter <IConsentLinkInputParameter[]>]`: Array of links
    - `[ObjectId <String>]`: AAD OID (user or group) if the principal type is ActiveDirectory.                     MSA PUID if the principal type is MicrosoftAccount.
    - `[ParameterName <String>]`: Name of the parameter in the connection provider's oauthSettings
    - `[PrincipalType <PrincipalType?>]`: Principal type
    - `[RedirectUrl <String>]`: Name of the parameter in the connection provider's oauthSettings
    - `[TenantId <String>]`: Tenant Id

#### PARAMETER <IConsentLinkInputParameter[]>: Array of links
  - `[ObjectId <String>]`: AAD OID (user or group) if the principal type is ActiveDirectory.                     MSA PUID if the principal type is MicrosoftAccount.
  - `[ParameterName <String>]`: Name of the parameter in the connection provider's oauthSettings
  - `[PrincipalType <PrincipalType?>]`: Principal type
  - `[RedirectUrl <String>]`: Name of the parameter in the connection provider's oauthSettings
  - `[TenantId <String>]`: Tenant Id

## RELATED LINKS

