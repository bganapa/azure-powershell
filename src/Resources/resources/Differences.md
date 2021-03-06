## Incorrect Cmdlets

- Add-AzADGroupMember
    - TargetGroupObjectId
    - TargetGroupObject
    - TargetGroupDisplayName
- Export-AzDeploymentTemplate
    - DeploymentObject
    - Path
    - ApiVersion
    - Pre
- Export-AzResourceGroup
    - Path
    - IncludeParameterDefaultValue
    - IncludeComments
    - ApiVersion
    - Pre
- Get-AzDeployment
    - ApiVersion
    - Pre
- Get-AzDeploymentOperation
    - ApiVersion
    - Pre
- Get-AzManagedApplication
    - ApiVersion
    - Pre
- Get-AzManagedApplicationDefinition
    - ApiVersion
    - Pre
- Get-AzPolicyAssignment
    - ApiVersion
    - Pre
- Get-AzPolicyDefinition
    - Custom
    - ApiVersion
    - Pre
- Get-AzPolicySetDefinition
    - Custom
    - ApiVersion
    - Pre
- Get-AzProviderFeature
    - ListAvailable
- Get-AzResource
    - ExpandProperties
    - ApiVersion
    - Pre
- Get-AzResourceGroup
    - Location
    - ApiVersion
    - Pre
- Get-AzResourceProvider
    - Location
    - ListAvailable
    - ApiVersion
    - Pre
- Get-AzRoleAssignment
    - ParentResource
    - RoleDefinitionName
    - RoleDefinitionId
    - IncludeClassicAdministrators
- Get-AzTag
    - Name
    - Detailed
- Move-AzResource
    - ApiVersion
    - Pre
- New-AzADApplication
    - IdentifierUris
    - ReplyUrls
    - Password
    - CertValue
    - StartDate
    - EndDate
- New-AzADServicePrincipal
    - ApplicationId
    - DisplayName
    - ApplicationObject
    - CertValue
    - StartDate
    - EndDate
    - Scope
    - Role
    - SkipAssignment
- New-AzADUser
    - Password
    - ForceChangePasswordNextLogin
- New-AzDeployment
    - DeploymentDebugLogLevel
    - TemplateParameterObject
    - TemplateParameterFile
    - TemplateParameterUri
    - TemplateObject
    - TemplateFile
    - TemplateUri
    - ApiVersion
    - Pre
- New-AzManagedApplication
    - ManagedResourceGroupName
    - Plan
    - ApiVersion
    - Pre
- New-AzManagedApplicationDefinition
    - ApiVersion
    - Pre
- New-AzPolicyAssignment
    - PolicyDefinition
    - PolicySetDefinition
    - PolicyParameterObject
    - PolicyParameter
    - AssignIdentity
    - ApiVersion
    - Pre
- New-AzPolicyDefinition
    - Policy
    - ApiVersion
    - Pre
- New-AzPolicySetDefinition
    - ApiVersion
    - Pre
- New-AzResource
    - Properties
    - Plan
    - Sku
    - IsFullObject
    - ExtensionResourceName
    - ExtensionResourceType
    - ODataQuery
    - TenantLevel
    - ApiVersion
    - Pre
- New-AzResourceGroup
    - ApiVersion
    - Pre
- New-AzRoleAssignment
    - SignInName
    - ApplicationId
    - ResourceGroupName
    - ResourceName
    - ResourceType
    - ParentResource
    - RoleDefinitionName
- New-AzRoleDefinition
    - InputFile
- Register-AzResourceProvider
    - ApiVersion
    - Pre
- Remove-AzDeployment
    - ApiVersion
    - Pre
- Remove-AzManagedApplication
    - ApiVersion
    - Pre
- Remove-AzManagedApplicationDefinition
    - ApiVersion
    - Pre
- Remove-AzPolicyAssignment
    - ApiVersion
    - Pre
- Remove-AzPolicyDefinition
    - ApiVersion
    - Pre
- Remove-AzPolicySetDefinition
    - ApiVersion
    - Pre
- Remove-AzResource
    - ExtensionResourceName
    - ExtensionResourceType
    - ODataQuery
    - TenantLevel
    - ApiVersion
    - Pre
- Remove-AzResourceGroup
    - ApiVersion
    - Pre
- Remove-AzRoleAssignment
    - SignInName
    - ServicePrincipalName
    - ResourceGroupName
    - ResourceName
    - ResourceType
    - ParentResource
    - RoleDefinitionName
    - RoleDefinitionId
    - PassThru
- Remove-AzRoleDefinition
    - PassThru
- Set-AzManagedApplication
    - ManagedResourceGroupName
    - Plan
    - ApiVersion
    - Pre
- Set-AzManagedApplicationDefinition
    - ApiVersion
    - Pre
- Set-AzPolicyDefinition
    - Policy
    - ApiVersion
    - Pre
- Set-AzPolicySetDefinition
    - ApiVersion
    - Pre
- Set-AzResource
    - InputObject
    - Properties
    - Plan
    - Sku
    - UsePatchSemantics
    - ExtensionResourceName
    - ExtensionResourceType
    - ODataQuery
    - TenantLevel
    - ApiVersion
    - Pre
- Set-AzResourceGroup
    - ApiVersion
    - Pre
- Set-AzRoleDefinition
    - InputFile
- Stop-AzDeployment
    - ApiVersion
    - Pre
- Test-AzDeployment
    - TemplateParameterObject
    - TemplateParameterFile
    - TemplateParameterUri
    - TemplateObject
    - TemplateFile
    - TemplateUri
    - ApiVersion
    - Pre
- Unregister-AzResourceProvider
    - ApiVersion
    - Pre
- Update-AzADServicePrincipal
    - ApplicationId
    - ServicePrincipalName
    - DisplayName
    - Homepage
    - IdentifierUri
    - KeyCredential
    - PasswordCredential
- Update-AzADUser
    - Password
    - ForceChangePasswordNextLogin

## Correct Cmdlets

- Get-AzADApplication
- Get-AzADGroup
- Get-AzADGroupMember
- Get-AzADServicePrincipal
- Get-AzADUser
- Get-AzManagementGroup
- Get-AzRoleDefinition
- New-AzADGroup
- New-AzManagementGroup
- New-AzManagementGroupSubscription
- New-AzTag
- Register-AzProviderFeature
- Remove-AzADApplication
- Remove-AzADGroup
- Remove-AzADGroupMember
- Remove-AzADServicePrincipal
- Remove-AzADUser
- Remove-AzManagementGroup
- Remove-AzManagementGroupSubscription
- Remove-AzTag
- Update-AzADApplication
- Update-AzManagementGroup

## New Cmdlets

- Add-AzADApplicationOwner
- Add-AzADGroupOwner
- Get-AzADApplicationOwner
- Get-AzADGroupMemberGroup
- Get-AzADObject
- Get-AzADServicePrincipalOwner
- Get-AzADUserMemberGroup
- Get-AzApplicationKeyCredentials
- Get-AzApplicationPasswordCredentials
- Get-AzAuthorizationOperation
- Get-AzClassicAdministrator
- Get-AzDenyAssignment
- Get-AzDomain
- Get-AzEntity
- Get-AzManagementGroupDescendant
- Get-AzManagementLock
- Get-AzOAuth2PermissionGrant
- Get-AzPermission
- Get-AzProviderOperationsMetadata
- Get-AzResourceLink
- Get-AzResourceProviderOperationDetail
- Get-AzSubscriptionLocation
- Invoke-AzElevateGlobalAdministratorAccess
- Invoke-AzTenantBackfillStatus
- New-AzManagementLock
- New-AzOAuth2PermissionGrant
- New-AzResourceLink
- Remove-AzADApplicationOwner
- Remove-AzADGroupOwner
- Remove-AzManagementLock
- Remove-AzOAuth2PermissionGrant
- Remove-AzResourceLink
- Restore-AzADDeletedApplication
- Set-AzDeployment
- Set-AzManagementGroup
- Set-AzManagementLock
- Set-AzResourceLink
- Start-AzTenantBackfill
- Test-AzADGroupMember
- Test-AzDeploymentExistence
- Test-AzNameAvailability
- Test-AzResource
- Test-AzResourceGroup
- Test-AzResourceMove
- Update-AzApplicationKeyCredentials
- Update-AzApplicationPasswordCredentials
- Update-AzManagedApplication
- Update-AzResource
- Update-AzResourceGroup

## Missing Cmdlets

- Get-AzADAppCredential
- Get-AzADSpCredential
- Get-AzLocation
- Get-AzPolicyAlias
- Get-AzProviderOperation
- Get-AzResourceLock
- Invoke-AzResourceAction
- New-AzADAppCredential
- New-AzADSpCredential
- New-AzResourceLock
- Remove-AzADAppCredential
- Remove-AzADSpCredential
- Remove-AzResourceLock
- Set-AzPolicyAssignment
- Set-AzResourceLock
