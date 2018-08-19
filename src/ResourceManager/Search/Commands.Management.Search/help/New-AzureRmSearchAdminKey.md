---
external help file: Microsoft.Azure.Commands.Management.Search.dll-Help.xml
Module Name: AzureRM.Search
online version: https://docs.microsoft.com/en-us/powershell/module/azurerm.search/new-azurermsearchadminkey
schema: 2.0.0
---

# New-AzureRmSearchAdminKey

## SYNOPSIS
Regenerates an admin key of the Azure Search service.

## SYNTAX

### ResourceNameParameterSet (Default)
```
New-AzureRmSearchAdminKey [-ResourceGroupName] <String> [-ServiceName] <String> -KeyKind <PSSearchAdminKeyKind>
 [-Force] [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ParentObjectParameterSet
```
New-AzureRmSearchAdminKey [-ParentObject] <PSSearchService> -KeyKind <PSSearchAdminKeyKind> [-Force]
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ParentResourceIdParameterSet
```
New-AzureRmSearchAdminKey [-ParentResourceId] <String> -KeyKind <PSSearchAdminKeyKind> [-Force]
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The **New-AzureRmSearchAdminKey** cmdlet regenerates an admin key of the Azure Search service.

## EXAMPLES

### Example 1
```powershell
PS C:\> New-AzureRmSearchAdminKey -ResourceGroupName "TestAzureSearchPsGroup" -ServiceName "pstestazuresearch01" -KeyKind Primary

Confirm
Are you sure you want to regenerate 'Primary' key for Search Service 'pstestazuresearch01'?
[Y] Yes  [N] No  [S] Suspend  [?] Help (default is "Y"): y

Primary                          Secondary
-------                          ---------
85B3813D11904B591BE8A196C2C743A1 CEF791D5BAC2E6C0B232C56702F21E87
```

The example regenerates Primary key of the Azure Search Service.

## PARAMETERS

### -DefaultProfile
The credentials, account, tenant, and subscription used for communication with Azure.

```yaml
<<<<<<< HEAD
Type: IAzureContextContainer
=======
Type: Microsoft.Azure.Commands.Common.Authentication.Abstractions.IAzureContextContainer
>>>>>>> upstream/preview
Parameter Sets: (All)
Aliases: AzureRmContext, AzureCredential

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Force
Do not ask for confirmation.

```yaml
<<<<<<< HEAD
Type: SwitchParameter
=======
Type: System.Management.Automation.SwitchParameter
>>>>>>> upstream/preview
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -KeyKind
Search Service admin key kind (Primary/Secondary).

```yaml
<<<<<<< HEAD
Type: PSSearchAdminKeyKind
=======
Type: Microsoft.Azure.Commands.Management.Search.Models.PSSearchAdminKeyKind
>>>>>>> upstream/preview
Parameter Sets: (All)
Aliases:
Accepted values: Primary, Secondary

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ParentObject
Search Service Input Object.

```yaml
<<<<<<< HEAD
Type: PSSearchService
=======
Type: Microsoft.Azure.Commands.Management.Search.Models.PSSearchService
>>>>>>> upstream/preview
Parameter Sets: ParentObjectParameterSet
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -ParentResourceId
Search Service Resource Id.

```yaml
<<<<<<< HEAD
Type: String
=======
Type: System.String
>>>>>>> upstream/preview
Parameter Sets: ParentResourceIdParameterSet
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ResourceGroupName
Resource Group name.

```yaml
<<<<<<< HEAD
Type: String
=======
Type: System.String
>>>>>>> upstream/preview
Parameter Sets: ResourceNameParameterSet
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ServiceName
Search Service name.

```yaml
<<<<<<< HEAD
Type: String
=======
Type: System.String
>>>>>>> upstream/preview
Parameter Sets: ResourceNameParameterSet
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
<<<<<<< HEAD
Type: SwitchParameter
=======
Type: System.Management.Automation.SwitchParameter
>>>>>>> upstream/preview
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
<<<<<<< HEAD
Type: SwitchParameter
=======
Type: System.Management.Automation.SwitchParameter
>>>>>>> upstream/preview
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

<<<<<<< HEAD
### System.String

### Microsoft.Azure.Commands.Management.Search.Models.PSSearchService
=======
### Microsoft.Azure.Commands.Management.Search.Models.PSSearchService
Parameters: ParentObject (ByValue)

### System.String
>>>>>>> upstream/preview

## OUTPUTS

### Microsoft.Azure.Commands.Management.Search.Models.PSSearchAdminKey

## NOTES

## RELATED LINKS

[Get-AzureRmSearchAdminKeyPair](./Get-AzureRmSearchAdminKeyPair.md)
