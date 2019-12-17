---
external help file: RegisterWithAzure-help.xml
Module Name: Azs.Tools.Admin
online version:
schema: 2.0.0
---

# Get-AzsActivationKey

## SYNOPSIS
Retrieves the ActivationKey from the registration resource created during Register-AzsEnvironment

## SYNTAX

```
Get-AzsActivationKey [-RegistrationName] <String> [[-AzureContext] <PSObject>] [[-ResourceGroupName] <String>]
 [[-KeyOutputFilePath] <String>] [-ConnectedScenario] [<CommonParameters>]
```

## DESCRIPTION
This gets an activation key with details on the parameters and environment information from the registration resource. 
The activation key is used to create an activation record in AzureStack.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -RegistrationName
The neame of the registration resource created in Azure.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AzureContext
{{ Fill AzureContext Description }}

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: (Get-AzureRmContext)
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceGroupName
The name of the resource group where the registration resource was created.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: Azurestack
Accept pipeline input: False
Accept wildcard characters: False
```

### -KeyOutputFilePath
{{ Fill KeyOutputFilePath Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ConnectedScenario
{{ Fill ConnectedScenario Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
