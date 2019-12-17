---
external help file: RegisterWithAzure-help.xml
Module Name: Azs.Tools.Admin
online version:
schema: 2.0.0
---

# UnRegister-AzsEnvironment

## SYNOPSIS
UnRegister-AzsEnvironment will unregister your environment with Azure

## SYNTAX

```
UnRegister-AzsEnvironment [[-AzureContext] <PSObject>] [[-RegistrationToken] <String>]
 [[-RegistrationName] <String>] [[-ResourceGroupName] <String>] [[-ResourceGroupLocation] <String>]
 [[-CloudId] <String>] [<CommonParameters>]
```

## DESCRIPTION
UnRegister-AzsEnvironment removes the registration resource that was created in Azure during Register-AzsEnvironment

## EXAMPLES

### EXAMPLE 1
```
This example will unregister your Azure Stack environment using a registration token
```

UnRegister-AzsEnvironment -RegistrationToken $registrationToken

### EXAMPLE 2
```
This exmple will unregister your Azure Stack environment using the registration name.
```

UnRegister-AzsEnvironment -RegistrationName "AzsRegistration-TestEnvironment"

## PARAMETERS

### -AzureContext
{{ Fill AzureContext Description }}

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: (Get-AzureRmContext)
Accept pipeline input: False
Accept wildcard characters: False
```

### -RegistrationToken
The registration token created after running Get-AzsRegistrationToken.
This contains information used to find the registration name

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RegistrationName
The name of the registration resource that was created during Register-AzsEnvironment.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceGroupName
The name of the resource group that was created for the registration resource.
Defaults to 'azurestack'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: Azurestack
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceGroupLocation
The Azure location where the registration resource group was created.
Defaults to 'westcentralus'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: Westcentralus
Accept pipeline input: False
Accept wildcard characters: False
```

### -CloudId
{{ Fill CloudId Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
This should only be used if Register-AzsEnvironment was called previously.
If you would like to disable syndication or usage reporting
that was enabled during Set-AzsRegistration, then you will need to run Remove-AzsRegistration

## RELATED LINKS
