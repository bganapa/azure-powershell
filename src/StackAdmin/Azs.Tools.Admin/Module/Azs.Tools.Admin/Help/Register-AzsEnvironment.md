---
external help file: RegisterWithAzure-help.xml
Module Name: Azs.Tools.Admin
online version:
schema: 2.0.0
---

# Register-AzsEnvironment

## SYNOPSIS
Register-AzsEnvironment will register your environment with Azure but will not enable syndication or usage reporting.
This can be run on any computer with a connection to the internet.

## SYNTAX

```
Register-AzsEnvironment [-RegistrationToken] <String> [-RegistrationName] <String> [[-AzureContext] <PSObject>]
 [[-ResourceGroupName] <String>] [[-ResourceGroupLocation] <String>] [<CommonParameters>]
```

## DESCRIPTION
Register-AzsEnvironment creates a resource group and registration resource in Azure.
A registration token is required to register with Azure.

## EXAMPLES

### EXAMPLE 1
```
This example will register your Azure Stack environment with all default parameters.
```

Register-AzsEnvironment -RegistrationToken $registrationToken

### EXAMPLE 2
```
This example will register your Azure Stack environment with a specific name for a resource group
```

Register-AzsEnvironment -RegistrationToken $registrationToken -ResourceGroupName "ContosoRegistrations"

### EXAMPLE 3
```
This example will register your Azure Stack environment with a specific name for the registration resource
```

Register-AzsEnvironment -RegistrationToken $registrationToken -RegistrationName "AzsRegistration-TestEnvironment"

## PARAMETERS

### -RegistrationToken
The registration token created after running Get-AzsRegistrationToken.
This contains BillingModel, marketplace syndication, and other important information.

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

### -RegistrationName
The name of the registration resource to be created in Azure.
A unique name is highly encouraged for those registering multiple environments.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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
Position: 3
Default value: (Get-AzureRmContext)
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceGroupName
The name of the resource group that will contain the registration resource.
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
The Azure location where the registration resource group will be created.
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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
This function will not enable marketplace syndication or usage reporting.

## RELATED LINKS
