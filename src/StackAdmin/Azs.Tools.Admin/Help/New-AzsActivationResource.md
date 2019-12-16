---
external help file: RegisterWithAzure-help.xml
Module Name: Azs.Tools.Admin
online version:
schema: 2.0.0
---

# New-AzsActivationResource

## SYNOPSIS
Creates the activation resource in Azure Stack

## SYNTAX

```
New-AzsActivationResource [-PrivilegedEndpointCredential] <PSCredential> [-PrivilegedEndpoint] <String>
 [-ActivationKey] <String> [<CommonParameters>]
```

## DESCRIPTION
Creates an activation resource in Azure Stack in the resource group 'azurestack'.
Also configures usage and syndication options.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

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

### -ActivationKey
The text output of Get-AzsActivationKey.
Contains information required to configure Azure Stack registration appropriately.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
