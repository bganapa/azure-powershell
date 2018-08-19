---
external help file: Microsoft.Azure.Commands.Management.Search.dll-Help.xml
Module Name: AzureRM.Search
online version: https://docs.microsoft.com/en-us/powershell/module/azurerm.search/new-azurermsearchquerykey
schema: 2.0.0
---

# New-AzureRmSearchQueryKey

## SYNOPSIS
Create a new query key for the Azure Search service.

## SYNTAX

### ResourceNameParameterSet (Default)
```
New-AzureRmSearchQueryKey [-ResourceGroupName] <String> [-ServiceName] <String> -Name <String>
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ParentObjectParameterSet
```
New-AzureRmSearchQueryKey [-ParentObject] <PSSearchService> -Name <String>
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ParentResourceIdParameterSet
```
New-AzureRmSearchQueryKey [-ParentResourceId] <String> -Name <String>
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The **New-AzureRmSearchQueryKey** cmdlet creates a new query key for the Azure Search Service.

## EXAMPLES

### Example 1
```powershell
PS C:\> New-AzureRmSearchQueryKey -ResourceGroupName "TestAzureSearchPsGroup" -ServiceName "pstestazuresearch01" -Name "NewQueryKey1" -Force

Name         Key                             
----         ---                             
NewQueryKey1 65FBCF561228C5F0E01F8F2114C80459
```

The example creates a new query key for the Azure Search service.

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

### -Name
Search Service query key name.

```yaml
<<<<<<< HEAD
Type: String
=======
Type: System.String
>>>>>>> upstream/preview
Parameter Sets: (All)
Aliases:

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
Shows what would happen if the cmdlet runs. The cmdlet is not run.

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

### Microsoft.Azure.Commands.Management.Search.Models.PSSearchQueryKey

## NOTES

## RELATED LINKS

[Get-AzureRmSearchQueryKey.md](./Get-AzureRmSearchQueryKey.md)

[Remove-AzureRmSearchQueryKey.md](./Remove-AzureRmSearchQueryKey.md)
