---
external help file: AzureStack.Identity-help.xml
Module Name: Azs.Tools.Admin
online version:
schema: 2.0.0
---

# Unregister-AzsGuestDirectoryTenant

## SYNOPSIS
Removes a Guest Directory Tenant from Azure Stack.

## SYNTAX

```
Unregister-AzsGuestDirectoryTenant [-AdminResourceManagerEndpoint] <Uri> [-DirectoryTenantName] <String>
 [-GuestDirectoryTenantName] <String> [-ResourceGroupName] <String> [[-SubscriptionId] <String>]
 [[-SubscriptionName] <String>] [[-AutomationCredential] <PSCredential>] [<CommonParameters>]
```

## DESCRIPTION
Running this cmdlet will remove the specified directory tenant from the Azure Stack whitelist.
Ensure an Admin of the directory tenant has already run "Unregister-AzsWithMyDirectoryTenant" or they will be unable to
complete that cleanup of their directory tenant (this cmdlet will remove the permissions they need to query Azure Stack to determine what to delete).

## EXAMPLES

### EXAMPLE 1
```
$adminARMEndpoint = "https://adminmanagement.local.azurestack.external"
```

$azureStackDirectoryTenant = "\<homeDirectoryTenant\>.onmicrosoft.com"
$guestDirectoryTenantToBeOnboarded = "\<guestDirectoryTenant\>.onmicrosoft.com"

Unregister-AzsGuestDirectoryTenant -AdminResourceManagerEndpoint $adminARMEndpoint -DirectoryTenantName $azureStackDirectoryTenant -GuestDirectoryTenantName $guestDirectoryTenantToBeOnboarded

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
The name of the guest Directory Tenant which is to be decommissioned.

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

### -ResourceGroupName
The name of the resource group in which the directory tenant resource was created.

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

### -AutomationCredential
Optional: A credential used to authenticate with Azure Stack.
Must support a non-interactive authentication flow.
If not provided, the script will prompt for user credentials.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
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
