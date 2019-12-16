---
external help file: RegisterWithAzure-help.xml
Module Name: Azs.Tools.Admin
online version:
schema: 2.0.0
---

# Get-AzsRegistrationToken

## SYNOPSIS
Get-AzsRegistrationToken will generate a registration token from the input parameters.

## SYNTAX

```
Get-AzsRegistrationToken [-PrivilegedEndpointCredential] <PSCredential> [-PrivilegedEndpoint] <String>
 [-BillingModel] <String> [[-TokenOutputFilePath] <String>] [-UsageReportingEnabled]
 [-MarketplaceSyndicationEnabled] [[-AgreementNumber] <String>] [<CommonParameters>]
```

## DESCRIPTION
Get-AzsRegistrationToken will use the BillingModel, MarketplaceSyndicationEnabled, UsageReportingEnabled, and AgreementNumber (if necessary) parameters to generate a registration token. 
This token is used to enable / disable Azure Stack features such as Azure marketplace product syndication and Azure Stack usage reporting. 
A registration token is required to call Register-AzsEnvironment.

## EXAMPLES

### EXAMPLE 1
```
This example generates a registration token for use in Register-AzsEnvironment and writes it to a txt file.
```

$registrationToken = Get-AzsRegistrationToken -PrivilegedEndpointCredential $PrivilegedEndpointCredential -PrivilegedEndpoint $PrivilegedEndpoint -BillingModel Development -TokenOutputFilePath "C:\Temp\RegistrationToken.txt"

## PARAMETERS

### -PrivilegedEndpointCredential
Powershell object that contains credential information i.e.
user name and password.The Azure Stack administrator has access to the privileged endpoint to call approved cmdlets and scripts.
This parameter is mandatory and if not supplied then this function will request manual input of username and password

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
The name of the VM that has permissions to perform approved powershell cmdlets and scripts.
Usually has a name in the format of \<ComputerName\>-ERCSxx where \<ComputerName\>
is the name of the machine and ERCS is followed by a number between 01 and 03.
Example: Azs-ERCS01 (from the ASDK)

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

### -BillingModel
The billing model that will be used for this environment.
Select from "Capacity", and "Development".
Defaults to "Development" which is usable for POC / ASDK installments.
Please see documentation for more information: https://docs.microsoft.com/en-us/azure/azure-stack/azure-stack-billing-and-chargeback

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: Capacity
Accept pipeline input: False
Accept wildcard characters: False
```

### -TokenOutputFilePath
This parameter sets the output location for the registration token.

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

### -UsageReportingEnabled
{{ Fill UsageReportingEnabled Description }}

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

### -MarketplaceSyndicationEnabled
{{ Fill MarketplaceSyndicationEnabled Description }}

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

### -AgreementNumber
A valid agreement number must be provided if the 'capacity' BillingModel parameter is provided.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
This function is designed to only be used in conjunction with Register-AzsEnvironment.
This will not enable any Azure Stack marketplace syndication or usage reporting features.
Example:

$registrationToken = Get-AzsRegistrationToken -PrivilegedEndpointCredential $PrivilegedEndpointCredential -PrivilegedEndpoint $PrivilegedEndpoint -BillingModel Development -TokenOutputFilePath "C:\Temp\RegistrationToken.txt"
Register-AzsEnvironment -PrivilegedEndpointCredential $PrivilegedEndpointCredential -PrivilegedEndpoint $PrivilegedEndpoint -RegistrationToken $registrationToken

## RELATED LINKS
