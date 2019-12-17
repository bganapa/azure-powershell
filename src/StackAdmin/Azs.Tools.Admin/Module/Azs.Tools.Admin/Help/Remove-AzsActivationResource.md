---
external help file: RegisterWithAzure-help.xml
Module Name: Azs.Tools.Admin
online version:
schema: 2.0.0
---

# Remove-AzsActivationResource

## SYNOPSIS
De-activates Azure Stack in Disconnected Environments

## SYNTAX

```
Remove-AzsActivationResource [-PrivilegedEndpointCredential] <PSCredential> [-PrivilegedEndpoint] <String>
 [<CommonParameters>]
```

## DESCRIPTION
Takes Azure Stack PrivilegedEndpoint and PrivilegedEndpoint credential as input, and deactivates the activation properties created by New-AzsActivationResource

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -PrivilegedEndpointCredential
{{ Fill PrivilegedEndpointCredential Description }}

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
{{ Fill PrivilegedEndpoint Description }}

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
