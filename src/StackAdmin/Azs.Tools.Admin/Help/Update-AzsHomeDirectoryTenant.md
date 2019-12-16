---
external help file: AzureStack.Identity-help.xml
Module Name: Azs.Tools.Admin
online version:
schema: 2.0.0
---

# Update-AzsHomeDirectoryTenant

## SYNOPSIS
Consents to any missing permissions for Azure Stack identity applications in the home directory of Azure Stack.

## SYNTAX

```
Update-AzsHomeDirectoryTenant [-AdminResourceManagerEndpoint] <Uri> [-DirectoryTenantName] <String>
 [[-AutomationCredential] <PSCredential>] [<CommonParameters>]
```

## DESCRIPTION
Consents to any missing permissions for Azure Stack identity applications in the home directory of Azure Stack.
This is needed to complete the "installation" of new Resource Provider identity applications in Azure Stack.

## EXAMPLES

### EXAMPLE 1
```
$adminResourceManagerEndpoint = "https://adminmanagement.local.azurestack.external"
```

$homeDirectoryTenantName = "\<homeDirectoryTenant\>.onmicrosoft.com"

Update-AzsHomeDirectoryTenant -AdminResourceManagerEndpoint $adminResourceManagerEndpoint \`
    -DirectoryTenantName $homeDirectoryTenantName -Verbose

## PARAMETERS

### -AdminResourceManagerEndpoint
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
The name of the home Directory Tenant in which the Azure Stack Administrator subscription resides.

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
