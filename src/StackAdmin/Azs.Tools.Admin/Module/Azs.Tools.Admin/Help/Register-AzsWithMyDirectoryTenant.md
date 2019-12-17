---
external help file: AzureStack.Identity-help.xml
Module Name: Azs.Tools.Admin
online version:
schema: 2.0.0
---

# Register-AzsWithMyDirectoryTenant

## SYNOPSIS
Consents to the given Azure Stack instance within the callers's Azure Directory Tenant.

## SYNTAX

```
Register-AzsWithMyDirectoryTenant [-TenantResourceManagerEndpoint] <Uri> [-DirectoryTenantName] <String>
 [[-AutomationCredential] <PSCredential>] [<CommonParameters>]
```

## DESCRIPTION
Consents to the given Azure Stack instance within the callers's Azure Directory Tenant.
This is needed to propagate Azure Stack applications into the user's directory tenant.

## EXAMPLES

### EXAMPLE 1
```
$tenantARMEndpoint = "https://management.local.azurestack.external"
```

$myDirectoryTenantName = "\<guestDirectoryTenant\>.onmicrosoft.com"

Register-AzsWithMyDirectoryTenant -TenantResourceManagerEndpoint $tenantARMEndpoint \`
    -DirectoryTenantName $myDirectoryTenantName -Verbose -Debug

## PARAMETERS

### -TenantResourceManagerEndpoint
The endpoint of the Azure Stack Resource Manager service.

```yaml
Type: Uri
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DirectoryTenantName
The name of the directory tenant being onboarded.

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

### -AutomationCredential
Optional: A credential used to authenticate with Azure Stack.
Must support a non-interactive authentication flow.
If not provided, the script will prompt for user credentials.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
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
