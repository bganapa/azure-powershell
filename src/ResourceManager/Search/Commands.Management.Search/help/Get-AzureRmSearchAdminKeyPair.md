---
external help file: Microsoft.Azure.Commands.Management.Search.dll-Help.xml
Module Name: AzureRM.Search
online version: https://docs.microsoft.com/en-us/powershell/module/azurerm.search/get-azurermsearchadminkeypair
schema: 2.0.0
---

# Get-AzureRmSearchAdminKeyPair

## SYNOPSIS
Gets admin key pair of the Azure Search service.

## SYNTAX

### ResourceNameParameterSet (Default)
```
Get-AzureRmSearchAdminKeyPair [-ResourceGroupName] <String> [-ServiceName] <String>
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

### ParentObjectParameterSet
```
Get-AzureRmSearchAdminKeyPair [-ParentObject] <PSSearchService> [-DefaultProfile <IAzureContextContainer>]
 [<CommonParameters>]
```

### ParentResourceIdParameterSet
```
Get-AzureRmSearchAdminKeyPair [-ParentResourceId] <String> [-DefaultProfile <IAzureContextContainer>]
 [<CommonParameters>]
```

## DESCRIPTION
The **Get-AzureRmSearchAdminKeyPair** cmdlet gets the admin key pair of the Azure Search service.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-AzureRmSearchAdminKeyPair -ResourceGroupName felixwa-01 -ServiceName felixwa-basic-search

Primary                          Secondary                       
-------                          ---------                       
3B06A25BDADFF72EC132736BAA2547A1 E643B75A52E04DF13EB690807C451C55
```

The example gets admin key pair of the Azure Search service.

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

[New-AzureRmSearchAdminKey](./New-AzureRmSearchAdminKey.md)
