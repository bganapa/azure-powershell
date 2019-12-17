---
external help file: AzureStack.Identity-help.xml
Module Name: Azs.Tools.Admin
online version:
schema: 2.0.0
---

# Get-AzsHealthReport

## SYNOPSIS
Gets the health report of identity application in the Azure Stack home and guest directories

## SYNTAX

```
Get-AzsHealthReport [-AdminResourceManagerEndpoint] <Uri> [-DirectoryTenantName] <String>
 [[-AutomationCredential] <PSCredential>] [<CommonParameters>]
```

## DESCRIPTION
Gets the health report for Azure Stack identity applications in the home directory as well as guest directories of Azure Stack.
Any directories with an unhealthy status need to have their permissions updated.

## EXAMPLES

### EXAMPLE 1
```
$adminResourceManagerEndpoint = "https://adminmanagement.local.azurestack.external"
```

$homeDirectoryTenantName = "\<homeDirectoryTenant\>.onmicrosoft.com"

Get-AzsHealthReport -AdminResourceManagerEndpoint $adminResourceManagerEndpoint \`
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
