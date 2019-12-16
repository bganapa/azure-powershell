---
external help file: RegisterWithAzure-help.xml
Module Name: Azs.Tools.Admin
online version:
schema: 2.0.0
---

# Set-AzsRegistration

## SYNOPSIS
Set-AzsRegistration can be used to register Azure Stack with Azure and enable/disable marketplace syndication and usage reporting.
To run this function, you must have a public Azure subscription of any type. 
You must also be logged in to Azure Powershell with an account that is an owner or contributor to that subscription.

## SYNTAX

```
Set-AzsRegistration [-PrivilegedEndpointCredential] <PSCredential> [-PrivilegedEndpoint] <String>
 [-RegistrationName] <String> [[-AzureContext] <PSObject>] [[-ResourceGroupName] <String>]
 [[-ResourceGroupLocation] <String>] [[-BillingModel] <String>] [-MarketplaceSyndicationEnabled]
 [-UsageReportingEnabled] [[-AgreementNumber] <String>] [<CommonParameters>]
```

## DESCRIPTION
Set-AzsRegistration uses the current Azure Powershell context and runs scripts already present in Azure Stack from the ERCS VM to connect your Azure Stack to Azure.
You MUST be logged in to the Azure Powershell context that you want to register your Azure Stack with.
After connecting with Azure, you can download products from the marketplace (See the documentation for more information: https://docs.microsoft.com/en-us/azure/azure-stack/azure-stack-download-azure-marketplace-item).
Running this script with default parameters will enable marketplace syndication and usage data will default to being reported to Azure.
NOTE: Default billing model is 'Development' and is only usable for proof of concept builds.
To disable syndication or usage reporting see examples below.

This script will create the following resources by default:
- A service principal to perform resource actions
- A resource group in Azure (if needed)
- A registration resource in the created resource group in Azure
- An activation resource group and resource in Azure Stack

See documentation for more detail: https://docs.microsoft.com/en-us/azure/azure-stack/azure-stack-register

## EXAMPLES

### EXAMPLE 1
```
This example registers your AzureStack environment with Azure, enables syndication, and enables usage reporting to Azure.
```

Set-AzsRegistration -PrivilegedEndpointCredential $PrivilegedEndpointCredential -PrivilegedEndpoint "Azs-ERCS01"

### EXAMPLE 2
```
This example registers your AzureStack environment with Azure, enables syndication, and enables usage reporting to Azure, and supplies a custom name.
```

Set-AzsRegistration -PrivilegedEndpointCredential $PrivilegedEndpointCredential -PrivilegedEndpoint "Azs-ERCS01" -RegistrationName "AzsRegistration-TestEnvironment"

### EXAMPLE 3
```
This example registers your AzureStack environment with Azure, enables syndication, and disables usage reporting to Azure.
```

Set-AzsRegistration -PrivilegedEndpointCredential $PrivilegedEndpointCredential -PrivilegedEndpoint "Azs-ERCS01" -BillingModel 'Capacity' -UsageReportingEnabled:$false -AgreementNumber $MyAgreementNumber

### EXAMPLE 4
```
This example registers your AzureStack environment with Azure, enables syndication and usage and gives a specific name to the resource group
```

Set-AzsRegistration -PrivilegedEndpointCredential $PrivilegedEndpointCredential -PrivilegedEndpoint "Azs-ERCS02" -ResourceGroupName "ContosoStackRegistrations"

### EXAMPLE 5
```
This example disables syndication and disables usage reporting to Azure. Note that usage will still be collected, just not sent to Azure.
```

Set-AzsRegistration -PrivilegedEndpointCredential $PrivilegedEndpointCredential -PrivilegedEndpoint "Azs-ERCS01" -BillingModel Capacity -MarketplaceSyndicationEnabled:$false -UsageReportingEnabled:$false -AgreementNumber $MyAgreementNumber

## PARAMETERS

### -PrivilegedEndpointCredential
Powershell object that contains credential information i.e.
user name and password.The Azure Stack administrator has access to the Privileged Endpoint VM (also known as Emergency Console) to call whitelisted cmdlets and scripts.
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
The name of the registration resource to be created in Azure.
A unique name is highly encouraged for those registering multiple environments.

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

### -AzureContext
{{ Fill AzureContext Description }}

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: (Get-AzureRmContext)
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceGroupName
This will be the name of the resource group in Azure where the registration resource is stored.
Defaults to "azurestack"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: Azurestack
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceGroupLocation
The location where the resource group will be created.
Defaults to "westcentralus"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: @{'AzureCloud'='westcentralus'; 
                                            'AzureChinaCloud'='ChinaEast'; 
                                            'AzureUSGovernment'='usgovvirginia'; 
                                            'CustomCloud'='westcentralus'}[$AzureContext.Environment.Name]
Accept pipeline input: False
Accept wildcard characters: False
```

### -BillingModel
The billing model that the subscription uses.
Select from "Capacity","PayAsYouUse", and "Development".
Defaults to "Development" which is usable for POC installments.
Please see documentation for more information: https://docs.microsoft.com/en-us/azure/azure-stack/azure-stack-billing-and-chargeback

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: Development
Accept pipeline input: False
Accept wildcard characters: False
```

### -MarketplaceSyndicationEnabled
This is a switch that determines if this registration will allow you to download products from the Azure Marketplace.
Defaults to $true

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: True
Accept pipeline input: False
Accept wildcard characters: False
```

### -UsageReportingEnabled
This is a switch that determines if usage records are reported to Azure.
Defaults to $true.
Note: This cannot be disabled with billing model set to PayAsYouUse.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: True
Accept pipeline input: False
Accept wildcard characters: False
```

### -AgreementNumber
Used when the billing model is set to capacity.
You will need to provide a specific agreement number associated with your billing agreement.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
If you would like to un-Register with Azure by turning off marketplace syndication, disabling usage reporting, and removing the registration resource from Azure you can run Remove-AzsRegistration.
Note that this will remove any downloaded marketplace products.

If you would like to use a different subscription for registration you must first run Remove-AzsRegistration followed by Set-AzsRegistration after logging into the appropriate Azure Powershell context.
This will remove any downloaded marketplace products and they will need to be re-downloaded.

You MUST be logged in to Azure before attempting to use Set-AzsRegistration.
It is very important to ensure you are logged in to the correct Azure Account in Powershell before running this function.

## RELATED LINKS
