---
external help file: AzureStack.Identity-help.xml
Module Name: Azs.Tools.Admin
online version:
schema: 2.0.0
---

# New-AzsAdGraphServicePrincipal

## SYNOPSIS
This function is used to create a Service Principal on the AD Graph in an AD FS topology

## SYNTAX

```
New-AzsAdGraphServicePrincipal [-DisplayName] <Object> [-ERCSMachineName <String>]
 [-AdminCredential] <PSCredential> [<CommonParameters>]
```

## DESCRIPTION
The command creates a certificate in the cert store of the local user and uses that certificate to create a Service Principal in the Azure Stack Stamp Active Directory.

## EXAMPLES

### EXAMPLE 1
```
$servicePrincipal = New-AzsAdGraphServicePrincipal -DisplayName "myapp12" -AdminCredential $(Get-Credential) -Verbose
```

## PARAMETERS

### -DisplayName
Display Name of the Service Principal

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ERCSMachineName
PEP Machine name

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Azs-ERCS01
Accept pipeline input: False
Accept wildcard characters: False
```

### -AdminCredential
Domain Administrator Credential to create Service Principal

```yaml
Type: PSCredential
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
