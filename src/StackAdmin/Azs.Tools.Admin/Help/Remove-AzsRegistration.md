---
external help file: RegisterWithAzure-help.xml
Module Name: Azs.Tools.Admin
online version:
schema: 2.0.0
---

# Remove-AzsRegistration

## SYNOPSIS
Remove-AzsRegistration can be used to disable syndication, disable usage reporting, and unregister your environment with Azure.
To run this function, you must have previously run Set-AzsRegistration
You must also be logged in to Azure Powershell with an account that is an owner or contributor to that subscription.

## SYNTAX

```
Remove-AzsRegistration [-PrivilegedEndpointCredential] <PSCredential> [-PrivilegedEndpoint] <String>
 [-RegistrationName] <String> [[-ResourceGroupName] <String>] [[-ResourceGroupLocation] <String>]
 [[-AzureContext] <PSObject>] [<CommonParameters>]
```

## DESCRIPTION
Remove-AzsRegistration uses the current Azure Powershell context and runs scripts already present in Azure Stack from the ERCS VM to remove a current registration from Azure.
You MUST be logged in to the Azure Powershell context that you want to disassociate your environment from.
You must have already run Set-AzsRegistration before running this function.

## EXAMPLES

### EXAMPLE 1
```
This example unregisters your AzureStack environment with Azure.
```

Remove-AzsRegistration -PrivilegedEndpointCredential $PrivilegedEndpointCredential -PrivilegedEndpoint $PrivilegedEndpoint

### EXAMPLE 2
```
This example unregisters your AzureStack environment with Azure by pointing to a specific registration
```

Remove-AzsRegistration -PrivilegedEndpointCredential $PrivilegedEndpointCredential -PrivilegedEndpoint $PrivilegedEndpoint -RegistrationName "AzsRegistration-TestEnvironment"

## PARAMETERS

### -PrivilegedEndpointCredential
Powershell object that contains credential information i.e.
user name and password.
The Azure Stack administrator has access to the JEA Computer (also known as Emergency Console) to call whitelisted cmdlets and scripts.
If not supplied script will request manual input of username and password

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PrivilegedEndpoint
Privileged Endpoint VM that performs environment administration actions.
Also known as Emergency Console VM.(Example: AzS-ERCS01 for the ASDK)

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

### -RegistrationName
The name of the registration resource that was created in Azure.
If you have a unique name you should supply it here for removing registration.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceGroupName
This is the name of the resource group in Azure where the registration resource has been created.
Defaults to "azurestack"

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
The location where the resource group has been created.
Defaults to "westcentralus"

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

### -AzureContext
{{ Fill AzureContext Description }}

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: (Get-AzureRmContext)
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
It is very important to ensure you are logged in to the correct Azure Account in Powershell before running this function.

## RELATED LINKS
