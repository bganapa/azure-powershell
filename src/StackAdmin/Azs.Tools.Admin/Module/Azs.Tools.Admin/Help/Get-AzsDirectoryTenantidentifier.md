---
external help file: AzureStack.Identity-help.xml
Module Name: Azs.Tools.Admin
online version:
schema: 2.0.0
---

# Get-AzsDirectoryTenantidentifier

## SYNOPSIS
Get the Guid of the directory tenant

## SYNTAX

```
Get-AzsDirectoryTenantidentifier [-Authority] <Object> [<CommonParameters>]
```

## DESCRIPTION
This function fetches the OpenID configuration metadata from the identity system and parses the Directory TenantID out of it. 
Azure Stack AD FS is configured to be a single tenanted identity system with a TenantID.

## EXAMPLES

### EXAMPLE 1
```
Get-AzsDirectoryTenantIdentifier -authority https://login.windows.net/microsoft.onmicrosoft.com
```

### EXAMPLE 2
```
Get-AzsDirectoryTenantIdentifier -authority https://adfs.local.azurestack.external/adfs
```

## PARAMETERS

### -Authority
The Authority of the identity system, e.g.
"https://login.windows.net/microsoft.onmicrosoft.com"

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
