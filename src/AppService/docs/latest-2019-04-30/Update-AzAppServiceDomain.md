---
external help file:
Module Name: Az.AppService
online version: https://docs.microsoft.com/en-us/powershell/module/az.appservice/update-azappservicedomain
schema: 2.0.0
---

# Update-AzAppServiceDomain

## SYNOPSIS
Creates or updates a domain.

## SYNTAX

### UpdateExpanded (Default)
```
Update-AzAppServiceDomain -Name <String> -ResourceGroupName <String> [-SubscriptionId <String>]
 [-AuthCode <String>] [-AutoRenew] [-ConsentAgreedAt <DateTime>] [-ConsentAgreedBy <String>]
 [-ConsentAgreementKey <String[]>] [-ContactAdminAddressMailingAddress1 <String>]
 [-ContactAdminAddressMailingAddress2 <String>] [-ContactAdminAddressMailingCity <String>]
 [-ContactAdminAddressMailingCountry <String>] [-ContactAdminAddressMailingPostalCode <String>]
 [-ContactAdminAddressMailingState <String>] [-ContactAdminEmail <String>] [-ContactAdminFax <String>]
 [-ContactAdminJobTitle <String>] [-ContactAdminNameFirst <String>] [-ContactAdminNameLast <String>]
 [-ContactAdminNameMiddle <String>] [-ContactAdminOrganization <String>] [-ContactAdminPhone <String>]
 [-ContactBillingAddressMailingAddress1 <String>] [-ContactBillingAddressMailingAddress2 <String>]
 [-ContactBillingAddressMailingCity <String>] [-ContactBillingAddressMailingCountry <String>]
 [-ContactBillingAddressMailingPostalCode <String>] [-ContactBillingAddressMailingState <String>]
 [-ContactBillingEmail <String>] [-ContactBillingFax <String>] [-ContactBillingJobTitle <String>]
 [-ContactBillingNameFirst <String>] [-ContactBillingNameLast <String>] [-ContactBillingNameMiddle <String>]
 [-ContactBillingOrganization <String>] [-ContactBillingPhone <String>]
 [-ContactRegistrantAddressMailingAddress1 <String>] [-ContactRegistrantAddressMailingAddress2 <String>]
 [-ContactRegistrantAddressMailingCity <String>] [-ContactRegistrantAddressMailingCountry <String>]
 [-ContactRegistrantAddressMailingPostalCode <String>] [-ContactRegistrantAddressMailingState <String>]
 [-ContactRegistrantEmail <String>] [-ContactRegistrantFax <String>] [-ContactRegistrantJobTitle <String>]
 [-ContactRegistrantNameFirst <String>] [-ContactRegistrantNameLast <String>]
 [-ContactRegistrantNameMiddle <String>] [-ContactRegistrantOrganization <String>]
 [-ContactRegistrantPhone <String>] [-ContactTechAddressMailingAddress1 <String>]
 [-ContactTechAddressMailingAddress2 <String>] [-ContactTechAddressMailingCity <String>]
 [-ContactTechAddressMailingCountry <String>] [-ContactTechAddressMailingPostalCode <String>]
 [-ContactTechAddressMailingState <String>] [-ContactTechEmail <String>] [-ContactTechFax <String>]
 [-ContactTechJobTitle <String>] [-ContactTechNameFirst <String>] [-ContactTechNameLast <String>]
 [-ContactTechNameMiddle <String>] [-ContactTechOrganization <String>] [-ContactTechPhone <String>]
 [-DnsType <DnsType>] [-DnsZoneId <String>] [-Kind <String>] [-Privacy] [-TargetDnsType <DnsType>]
 [-DefaultProfile <PSObject>] [-Confirm] [-WhatIf] [<CommonParameters>]
```

### Update
```
Update-AzAppServiceDomain -Name <String> -ResourceGroupName <String> -Domain <IDomainPatchResource>
 [-SubscriptionId <String>] [-DefaultProfile <PSObject>] [-Confirm] [-WhatIf] [<CommonParameters>]
```

### UpdateViaIdentity
```
Update-AzAppServiceDomain -InputObject <IAppServiceIdentity> -Domain <IDomainPatchResource>
 [-DefaultProfile <PSObject>] [-Confirm] [-WhatIf] [<CommonParameters>]
```

### UpdateViaIdentityExpanded
```
Update-AzAppServiceDomain -InputObject <IAppServiceIdentity> [-AuthCode <String>] [-AutoRenew]
 [-ConsentAgreedAt <DateTime>] [-ConsentAgreedBy <String>] [-ConsentAgreementKey <String[]>]
 [-ContactAdminAddressMailingAddress1 <String>] [-ContactAdminAddressMailingAddress2 <String>]
 [-ContactAdminAddressMailingCity <String>] [-ContactAdminAddressMailingCountry <String>]
 [-ContactAdminAddressMailingPostalCode <String>] [-ContactAdminAddressMailingState <String>]
 [-ContactAdminEmail <String>] [-ContactAdminFax <String>] [-ContactAdminJobTitle <String>]
 [-ContactAdminNameFirst <String>] [-ContactAdminNameLast <String>] [-ContactAdminNameMiddle <String>]
 [-ContactAdminOrganization <String>] [-ContactAdminPhone <String>]
 [-ContactBillingAddressMailingAddress1 <String>] [-ContactBillingAddressMailingAddress2 <String>]
 [-ContactBillingAddressMailingCity <String>] [-ContactBillingAddressMailingCountry <String>]
 [-ContactBillingAddressMailingPostalCode <String>] [-ContactBillingAddressMailingState <String>]
 [-ContactBillingEmail <String>] [-ContactBillingFax <String>] [-ContactBillingJobTitle <String>]
 [-ContactBillingNameFirst <String>] [-ContactBillingNameLast <String>] [-ContactBillingNameMiddle <String>]
 [-ContactBillingOrganization <String>] [-ContactBillingPhone <String>]
 [-ContactRegistrantAddressMailingAddress1 <String>] [-ContactRegistrantAddressMailingAddress2 <String>]
 [-ContactRegistrantAddressMailingCity <String>] [-ContactRegistrantAddressMailingCountry <String>]
 [-ContactRegistrantAddressMailingPostalCode <String>] [-ContactRegistrantAddressMailingState <String>]
 [-ContactRegistrantEmail <String>] [-ContactRegistrantFax <String>] [-ContactRegistrantJobTitle <String>]
 [-ContactRegistrantNameFirst <String>] [-ContactRegistrantNameLast <String>]
 [-ContactRegistrantNameMiddle <String>] [-ContactRegistrantOrganization <String>]
 [-ContactRegistrantPhone <String>] [-ContactTechAddressMailingAddress1 <String>]
 [-ContactTechAddressMailingAddress2 <String>] [-ContactTechAddressMailingCity <String>]
 [-ContactTechAddressMailingCountry <String>] [-ContactTechAddressMailingPostalCode <String>]
 [-ContactTechAddressMailingState <String>] [-ContactTechEmail <String>] [-ContactTechFax <String>]
 [-ContactTechJobTitle <String>] [-ContactTechNameFirst <String>] [-ContactTechNameLast <String>]
 [-ContactTechNameMiddle <String>] [-ContactTechOrganization <String>] [-ContactTechPhone <String>]
 [-DnsType <DnsType>] [-DnsZoneId <String>] [-Kind <String>] [-Privacy] [-TargetDnsType <DnsType>]
 [-DefaultProfile <PSObject>] [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Creates or updates a domain.

## EXAMPLES

### Example 1: {{ Add title here }}
```powershell
PS C:\> {{ Add code here }}

{{ Add output here }}
```

{{ Add description here }}

### Example 2: {{ Add title here }}
```powershell
PS C:\> {{ Add code here }}

{{ Add output here }}
```

{{ Add description here }}

## PARAMETERS

### -AuthCode
HELP MESSAGE MISSING

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -AutoRenew
\<code\>true\</code\> if the domain should be automatically renewed; otherwise, \<code\>false\</code\>.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ConsentAgreedAt
Timestamp when the agreements were accepted.

```yaml
Type: System.DateTime
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ConsentAgreedBy
Client IP address.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ConsentAgreementKey
List of applicable legal agreement keys.
This list can be retrieved using ListLegalAgreements API under \<code\>TopLevelDomain\</code\> resource.

```yaml
Type: System.String[]
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactAdminAddressMailingAddress1
First line of an Address.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactAdminAddressMailingAddress2
The second line of the Address.
Optional.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactAdminAddressMailingCity
The city for the address.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactAdminAddressMailingCountry
The country for the address.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactAdminAddressMailingPostalCode
The postal code for the address.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactAdminAddressMailingState
The state or province for the address.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactAdminEmail
Email address.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactAdminFax
Fax number.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactAdminJobTitle
Job title.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactAdminNameFirst
First name.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactAdminNameLast
Last name.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactAdminNameMiddle
Middle name.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactAdminOrganization
Organization contact belongs to.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactAdminPhone
Phone number.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactBillingAddressMailingAddress1
First line of an Address.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactBillingAddressMailingAddress2
The second line of the Address.
Optional.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactBillingAddressMailingCity
The city for the address.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactBillingAddressMailingCountry
The country for the address.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactBillingAddressMailingPostalCode
The postal code for the address.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactBillingAddressMailingState
The state or province for the address.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactBillingEmail
Email address.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactBillingFax
Fax number.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactBillingJobTitle
Job title.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactBillingNameFirst
First name.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactBillingNameLast
Last name.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactBillingNameMiddle
Middle name.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactBillingOrganization
Organization contact belongs to.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactBillingPhone
Phone number.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactRegistrantAddressMailingAddress1
First line of an Address.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactRegistrantAddressMailingAddress2
The second line of the Address.
Optional.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactRegistrantAddressMailingCity
The city for the address.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactRegistrantAddressMailingCountry
The country for the address.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactRegistrantAddressMailingPostalCode
The postal code for the address.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactRegistrantAddressMailingState
The state or province for the address.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactRegistrantEmail
Email address.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactRegistrantFax
Fax number.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactRegistrantJobTitle
Job title.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactRegistrantNameFirst
First name.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactRegistrantNameLast
Last name.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactRegistrantNameMiddle
Middle name.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactRegistrantOrganization
Organization contact belongs to.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactRegistrantPhone
Phone number.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactTechAddressMailingAddress1
First line of an Address.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactTechAddressMailingAddress2
The second line of the Address.
Optional.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactTechAddressMailingCity
The city for the address.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactTechAddressMailingCountry
The country for the address.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactTechAddressMailingPostalCode
The postal code for the address.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactTechAddressMailingState
The state or province for the address.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactTechEmail
Email address.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactTechFax
Fax number.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactTechJobTitle
Job title.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactTechNameFirst
First name.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactTechNameLast
Last name.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactTechNameMiddle
Middle name.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactTechOrganization
Organization contact belongs to.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ContactTechPhone
Phone number.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -DefaultProfile
The credentials, account, tenant, and subscription used for communication with Azure.

```yaml
Type: System.Management.Automation.PSObject
Parameter Sets: (All)
Aliases: AzureRMContext, AzureCredential

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -DnsType
Current DNS type

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.AppService.Support.DnsType
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -DnsZoneId
Azure DNS Zone to use

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -Domain
ARM resource for a domain.
To construct, see NOTES section for DOMAIN properties and create a hash table.

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.AppService.Models.Api20150401.IDomainPatchResource
Parameter Sets: Update, UpdateViaIdentity
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
Dynamic: False
```

### -InputObject
Identity Parameter
To construct, see NOTES section for INPUTOBJECT properties and create a hash table.

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.AppService.Models.IAppServiceIdentity
Parameter Sets: UpdateViaIdentity, UpdateViaIdentityExpanded
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
Dynamic: False
```

### -Kind
Kind of resource.

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -Name
Name of the domain.

```yaml
Type: System.String
Parameter Sets: Update, UpdateExpanded
Aliases: DomainName

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -Privacy
\<code\>true\</code\> if domain privacy is enabled for this domain; otherwise, \<code\>false\</code\>.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -ResourceGroupName
Name of the resource group to which the resource belongs.

```yaml
Type: System.String
Parameter Sets: Update, UpdateExpanded
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -SubscriptionId
Your Azure subscription ID.
This is a GUID-formatted string (e.g.
00000000-0000-0000-0000-000000000000).

```yaml
Type: System.String
Parameter Sets: Update, UpdateExpanded
Aliases:

Required: False
Position: Named
Default value: (Get-AzContext).Subscription.Id
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -TargetDnsType
Target DNS type (would be used for migration)

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.AppService.Support.DnsType
Parameter Sets: UpdateExpanded, UpdateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
Dynamic: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Microsoft.Azure.PowerShell.Cmdlets.AppService.Models.Api20150401.IDomainPatchResource

### Microsoft.Azure.PowerShell.Cmdlets.AppService.Models.IAppServiceIdentity

## OUTPUTS

### Microsoft.Azure.PowerShell.Cmdlets.AppService.Models.Api20180201.IDomain

## ALIASES

## NOTES

### COMPLEX PARAMETER PROPERTIES
To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

#### DOMAIN <IDomainPatchResource>: ARM resource for a domain.
  - `ContactAdminAddressMailingAddress1 <String>`: First line of an Address.
  - `ContactAdminAddressMailingCity <String>`: The city for the address.
  - `ContactAdminAddressMailingCountry <String>`: The country for the address.
  - `ContactAdminAddressMailingPostalCode <String>`: The postal code for the address.
  - `ContactAdminAddressMailingState <String>`: The state or province for the address.
  - `ContactAdminEmail <String>`: Email address.
  - `ContactAdminNameFirst <String>`: First name.
  - `ContactAdminNameLast <String>`: Last name.
  - `ContactAdminPhone <String>`: Phone number.
  - `ContactBillingAddressMailingAddress1 <String>`: First line of an Address.
  - `ContactBillingAddressMailingCity <String>`: The city for the address.
  - `ContactBillingAddressMailingCountry <String>`: The country for the address.
  - `ContactBillingAddressMailingPostalCode <String>`: The postal code for the address.
  - `ContactBillingAddressMailingState <String>`: The state or province for the address.
  - `ContactBillingEmail <String>`: Email address.
  - `ContactBillingNameFirst <String>`: First name.
  - `ContactBillingNameLast <String>`: Last name.
  - `ContactBillingPhone <String>`: Phone number.
  - `ContactRegistrantAddressMailingAddress1 <String>`: First line of an Address.
  - `ContactRegistrantAddressMailingCity <String>`: The city for the address.
  - `ContactRegistrantAddressMailingCountry <String>`: The country for the address.
  - `ContactRegistrantAddressMailingPostalCode <String>`: The postal code for the address.
  - `ContactRegistrantAddressMailingState <String>`: The state or province for the address.
  - `ContactRegistrantEmail <String>`: Email address.
  - `ContactRegistrantNameFirst <String>`: First name.
  - `ContactRegistrantNameLast <String>`: Last name.
  - `ContactRegistrantPhone <String>`: Phone number.
  - `ContactTechAddressMailingAddress1 <String>`: First line of an Address.
  - `ContactTechAddressMailingCity <String>`: The city for the address.
  - `ContactTechAddressMailingCountry <String>`: The country for the address.
  - `ContactTechAddressMailingPostalCode <String>`: The postal code for the address.
  - `ContactTechAddressMailingState <String>`: The state or province for the address.
  - `ContactTechEmail <String>`: Email address.
  - `ContactTechNameFirst <String>`: First name.
  - `ContactTechNameLast <String>`: Last name.
  - `ContactTechPhone <String>`: Phone number.
  - `[Kind <String>]`: Kind of resource.
  - `[AuthCode <String>]`: 
  - `[AutoRenew <Boolean?>]`: <code>true</code> if the domain should be automatically renewed; otherwise, <code>false</code>.
  - `[ConsentAgreedAt <DateTime?>]`: Timestamp when the agreements were accepted.
  - `[ConsentAgreedBy <String>]`: Client IP address.
  - `[ConsentAgreementKey <String[]>]`: List of applicable legal agreement keys. This list can be retrieved using ListLegalAgreements API under <code>TopLevelDomain</code> resource.
  - `[ContactAdminAddressMailingAddress2 <String>]`: The second line of the Address. Optional.
  - `[ContactAdminFax <String>]`: Fax number.
  - `[ContactAdminJobTitle <String>]`: Job title.
  - `[ContactAdminNameMiddle <String>]`: Middle name.
  - `[ContactAdminOrganization <String>]`: Organization contact belongs to.
  - `[ContactBillingAddressMailingAddress2 <String>]`: The second line of the Address. Optional.
  - `[ContactBillingFax <String>]`: Fax number.
  - `[ContactBillingJobTitle <String>]`: Job title.
  - `[ContactBillingNameMiddle <String>]`: Middle name.
  - `[ContactBillingOrganization <String>]`: Organization contact belongs to.
  - `[ContactRegistrantAddressMailingAddress2 <String>]`: The second line of the Address. Optional.
  - `[ContactRegistrantFax <String>]`: Fax number.
  - `[ContactRegistrantJobTitle <String>]`: Job title.
  - `[ContactRegistrantNameMiddle <String>]`: Middle name.
  - `[ContactRegistrantOrganization <String>]`: Organization contact belongs to.
  - `[ContactTechAddressMailingAddress2 <String>]`: The second line of the Address. Optional.
  - `[ContactTechFax <String>]`: Fax number.
  - `[ContactTechJobTitle <String>]`: Job title.
  - `[ContactTechNameMiddle <String>]`: Middle name.
  - `[ContactTechOrganization <String>]`: Organization contact belongs to.
  - `[DnsType <DnsType?>]`: Current DNS type
  - `[DnsZoneId <String>]`: Azure DNS Zone to use
  - `[Privacy <Boolean?>]`: <code>true</code> if domain privacy is enabled for this domain; otherwise, <code>false</code>.
  - `[TargetDnsType <DnsType?>]`: Target DNS type (would be used for migration)

#### INPUTOBJECT <IAppServiceIdentity>: Identity Parameter
  - `[AnalysisName <String>]`: Analysis Name
  - `[ApiName <String>]`: The managed API name.
  - `[BackupId <String>]`: ID of the backup.
  - `[BaseAddress <String>]`: Module base address.
  - `[CertificateOrderName <String>]`: Name of the certificate order.
  - `[ConnectionName <String>]`: The connection name.
  - `[DeletedSiteId <String>]`: The numeric ID of the deleted app, e.g. 12345
  - `[DetectorName <String>]`: Detector Resource Name
  - `[DiagnosticCategory <String>]`: Diagnostic Category
  - `[DiagnosticsName <String>]`: Name of the diagnostics item.
  - `[DomainName <String>]`: Name of the domain.
  - `[DomainOwnershipIdentifierName <String>]`: Name of domain ownership identifier.
  - `[EntityName <String>]`: Name of the hybrid connection.
  - `[FunctionName <String>]`: Function name.
  - `[GatewayName <String>]`: Name of the gateway. Only the 'primary' gateway is supported.
  - `[HostName <String>]`: Hostname in the hostname binding.
  - `[HostingEnvironmentName <String>]`: Name of the hosting environment.
  - `[Id <String>]`: Resource identity path
  - `[Instance <String>]`: Name of the instance in the multi-role pool.
  - `[InstanceId <String>]`: ID of web app instance.
  - `[Location <String>]`: 
  - `[Name <String>]`: Name of the certificate.
  - `[NamespaceName <String>]`: Name of the Service Bus namespace.
  - `[OperationId <String>]`: GUID of the operation.
  - `[PremierAddOnName <String>]`: Add-on name.
  - `[ProcessId <String>]`: PID.
  - `[PublicCertificateName <String>]`: Public certificate name.
  - `[RelayName <String>]`: Name of the Service Bus relay.
  - `[ResourceGroupName <String>]`: Name of the resource group to which the resource belongs.
  - `[RouteName <String>]`: Name of the Virtual Network route.
  - `[SiteExtensionId <String>]`: Site extension name.
  - `[SiteName <String>]`: Site Name
  - `[Slot <String>]`: Name of web app slot. If not specified then will default to production slot.
  - `[SnapshotId <String>]`: The ID of the snapshot to read.
  - `[SourceControlType <String>]`: Type of source control
  - `[SubscriptionId <String>]`: Your Azure subscription ID. This is a GUID-formatted string (e.g. 00000000-0000-0000-0000-000000000000).
  - `[ThreadId <String>]`: TID.
  - `[View <String>]`: The type of view. This can either be "summary" or "detailed".
  - `[VnetName <String>]`: Name of the Virtual Network.
  - `[WebJobName <String>]`: Name of Web Job.
  - `[WorkerName <String>]`: Name of worker machine, which typically starts with RD.
  - `[WorkerPoolName <String>]`: Name of the worker pool.

## RELATED LINKS

