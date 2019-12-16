---
external help file: AzureStack.Identity-help.xml
Module Name: Azs.Tools.Admin
online version:
schema: 2.0.0
---

# Register-AzsGuestDirectoryTenant

## SYNOPSIS
Adds a Guest Directory Tenant to Azure Stack.

## SYNTAX

```
Register-AzsGuestDirectoryTenant [-AdminResourceManagerEndpoint] <Uri> [-DirectoryTenantName] <String>
 [-GuestDirectoryTenantName] <String[]> [-Location] <String> [[-SubscriptionId] <String>]
 [[-SubscriptionName] <String>] [-ResourceGroupName] <String> [[-AutomationCredential] <PSCredential>]
 [<CommonParameters>]
```

## DESCRIPTION
Running this cmdlet will add the specified directory tenant to the Azure Stack whitelist.

## EXAMPLES

### EXAMPLE 1
```
$adminARMEndpoint = "https://adminmanagement.local.azurestack.external"
```

$azureStackDirectoryTenant = "\<homeDirectoryTenant\>.onmicrosoft.com"
$guestDirectoryTenantToBeOnboarded = "\<guestDirectoryTenant\>.onmicrosoft.com"

Register-AzsGuestDirectoryTenant -AdminResourceManagerEndpoint $adminARMEndpoint -DirectoryTenantName $azureStackDirectoryTenant -GuestDirectoryTenantName $guestDirectoryTenantToBeOnboarded

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

### -GuestDirectoryTenantName
The names of the guest Directory Tenants which are to be onboarded.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Location
The location of your Azure Stack deployment.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SubscriptionId
The identifier of the Administrator Subscription.
If not specified, the script will attempt to use the set default subscription.

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

### -SubscriptionName
The display name of the Administrator Subscription.
If not specified, the script will attempt to use the set default subscription.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceGroupName
The name of the resource group in which the directory tenant registration resource should be created (resource group must already exist).

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 7
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

## RELATED LINKS
