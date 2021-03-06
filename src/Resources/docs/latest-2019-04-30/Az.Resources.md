---
Module Name: Az.Resources
Module Guid: 1bb10716-570a-45be-88c4-84927b145b93
Download Help Link: https://docs.microsoft.com/en-us/powershell/module/az.resources
Help Version: 1.0.0.0
Locale: en-US
---

# Az.Resources Module
## Description
Microsoft Azure PowerShell: Resources cmdlets

## Az.Resources Cmdlets
### [Add-AzADApplicationOwner](Add-AzADApplicationOwner.md)
Add an owner to an application.

### [Add-AzADGroupMember](Add-AzADGroupMember.md)
Add a member to a group.

### [Add-AzADGroupOwner](Add-AzADGroupOwner.md)
Add an owner to a group.

### [Export-AzDeploymentTemplate](Export-AzDeploymentTemplate.md)
Exports the template used for specified deployment.

### [Export-AzResourceGroup](Export-AzResourceGroup.md)
Captures the specified resource group as a template.

### [Get-AzADApplication](Get-AzADApplication.md)
Get an application by object ID.

### [Get-AzADApplicationKeyCredential](Get-AzADApplicationKeyCredential.md)
Get the keyCredentials associated with an application.

### [Get-AzADApplicationOwner](Get-AzADApplicationOwner.md)
The owners are a set of non-admin users who are allowed to modify this object.

### [Get-AzADApplicationPasswordCredential](Get-AzADApplicationPasswordCredential.md)
Get the passwordCredentials associated with an application.

### [Get-AzADDomain](Get-AzADDomain.md)
Gets a specific domain in the current tenant.

### [Get-AzADGroup](Get-AzADGroup.md)
Gets group information from the directory.

### [Get-AzADGroupMember](Get-AzADGroupMember.md)
Gets the members of a group.

### [Get-AzADGroupMemberGroup](Get-AzADGroupMemberGroup.md)
Gets a collection of object IDs of groups of which the specified group is a member.

### [Get-AzADServicePrincipal](Get-AzADServicePrincipal.md)
Gets service principal information from the directory.
Query by objectId or pass a filter to query by appId

### [Get-AzADServicePrincipalKeyCredential](Get-AzADServicePrincipalKeyCredential.md)
Get the keyCredentials associated with the specified service principal.

### [Get-AzADServicePrincipalOwner](Get-AzADServicePrincipalOwner.md)
The owners are a set of non-admin users who are allowed to modify this object.

### [Get-AzADServicePrincipalPasswordCredential](Get-AzADServicePrincipalPasswordCredential.md)
Gets the passwordCredentials associated with a service principal.

### [Get-AzADUser](Get-AzADUser.md)
Gets user information from the directory.

### [Get-AzADUserMemberGroup](Get-AzADUserMemberGroup.md)
Gets a collection that contains the object IDs of the groups of which the user is a member.

### [Get-AzDenyAssignment](Get-AzDenyAssignment.md)
Get the specified deny assignment.

### [Get-AzDeployment](Get-AzDeployment.md)
Gets a deployment.

### [Get-AzDeploymentOperation](Get-AzDeploymentOperation.md)
Gets a deployments operation.

### [Get-AzLocation](Get-AzLocation.md)
This operation provides all the locations that are available for resource providers; however, each resource provider may support a subset of this list.

### [Get-AzManagedApplication](Get-AzManagedApplication.md)
Gets the managed application.

### [Get-AzManagedApplicationDefinition](Get-AzManagedApplicationDefinition.md)
Gets the managed application definition.

### [Get-AzManagementGroup](Get-AzManagementGroup.md)
Get the details of the management group.

### [Get-AzManagementGroupDescendant](Get-AzManagementGroupDescendant.md)
List all entities that descend from a management group.\n

### [Get-AzPolicyAssignment](Get-AzPolicyAssignment.md)
This operation retrieves a single policy assignment, given its name and the scope it was created at.

### [Get-AzPolicyDefinition](Get-AzPolicyDefinition.md)
This operation retrieves the policy definition in the given subscription with the given name.

### [Get-AzPolicySetDefinition](Get-AzPolicySetDefinition.md)
This operation retrieves the policy set definition in the given subscription with the given name.

### [Get-AzProviderFeature](Get-AzProviderFeature.md)
Gets the preview feature with the specified name.

### [Get-AzProviderOperationsMetadata](Get-AzProviderOperationsMetadata.md)
Gets provider operations metadata for the specified resource provider.

### [Get-AzResource](Get-AzResource.md)
Gets a resource.

### [Get-AzResourceGroup](Get-AzResourceGroup.md)
Gets a resource group.

### [Get-AzResourceLock](Get-AzResourceLock.md)
Get a management lock by scope.

### [Get-AzResourceProvider](Get-AzResourceProvider.md)
Gets the specified resource provider.

### [Get-AzResourceProviderOperationDetail](Get-AzResourceProviderOperationDetail.md)
Gets a list of resource providers.

### [Get-AzRoleAssignment](Get-AzRoleAssignment.md)
Gets a role assignment by ID.

### [Get-AzRoleDefinition](Get-AzRoleDefinition.md)
Gets a role definition by ID.

### [Get-AzTag](Get-AzTag.md)
Gets the names and values of all resource tags that are defined in a subscription.

### [Invoke-AzElevateGlobalAdministratorAccess](Invoke-AzElevateGlobalAdministratorAccess.md)
Elevates access for a Global Administrator.

### [Move-AzResource](Move-AzResource.md)
The resources to move must be in the same source resource group.
The target resource group may be in a different subscription.
When moving resources, both the source group and the target group are locked for the duration of the operation.
Write and delete operations are blocked on the groups until the move completes.

### [New-AzADApplication](New-AzADApplication.md)
Create a new application.

### [New-AzADApplicationKeyCredential](New-AzADApplicationKeyCredential.md)
Adds a new key credential to a application.

### [New-AzADApplicationPasswordCredential](New-AzADApplicationPasswordCredential.md)
Adds a new password credential to an application.

### [New-AzADGroup](New-AzADGroup.md)
Create a group in the directory.

### [New-AzADServicePrincipal](New-AzADServicePrincipal.md)
Creates a service principal in the directory.

### [New-AzADServicePrincipalKeyCredential](New-AzADServicePrincipalKeyCredential.md)
Adds a new key credential to a service principal.

### [New-AzADServicePrincipalPasswordCredential](New-AzADServicePrincipalPasswordCredential.md)
Adds a new password credential to a service principal.

### [New-AzADUser](New-AzADUser.md)
Create a new user.

### [New-AzDeployment](New-AzDeployment.md)
You can provide the template and parameters directly in the request or link to JSON files.

### [New-AzManagedApplication](New-AzManagedApplication.md)
Creates a new managed application.

### [New-AzManagedApplicationDefinition](New-AzManagedApplicationDefinition.md)
Creates a new managed application definition.

### [New-AzManagementGroup](New-AzManagementGroup.md)
Create or update a management group.
If a management group is already created and a subsequent create request is issued with different properties, the management group properties will be updated.

### [New-AzManagementGroupSubscription](New-AzManagementGroupSubscription.md)
Associates existing subscription with the management group.

### [New-AzPolicyAssignment](New-AzPolicyAssignment.md)
This operation creates or updates a policy assignment with the given scope and name.
Policy assignments apply to all resources contained within their scope.
For example, when you assign a policy at resource group scope, that policy applies to all resources in the group.

### [New-AzPolicyDefinition](New-AzPolicyDefinition.md)
This operation creates or updates a policy definition in the given subscription with the given name.

### [New-AzPolicySetDefinition](New-AzPolicySetDefinition.md)
This operation creates or updates a policy set definition in the given subscription with the given name.

### [New-AzResource](New-AzResource.md)
Creates a resource.

### [New-AzResourceGroup](New-AzResourceGroup.md)
Creates or updates a resource group.

### [New-AzResourceLock](New-AzResourceLock.md)
When you apply a lock at a parent scope, all child resources inherit the same lock.
To create management locks, you must have access to Microsoft.Authorization/* or Microsoft.Authorization/locks/* actions.
Of the built-in roles, only Owner and User Access Administrator are granted those actions.

### [New-AzRoleAssignment](New-AzRoleAssignment.md)
Creates a role assignment.

### [New-AzRoleDefinition](New-AzRoleDefinition.md)
Creates or updates a role definition.

### [New-AzTag](New-AzTag.md)
The tag name can have a maximum of 512 characters and is case insensitive.
Tag names created by Azure have prefixes of microsoft, azure, or windows.
You cannot create tags with one of these prefixes.

### [Register-AzProviderFeature](Register-AzProviderFeature.md)
Registers the preview feature for the subscription.

### [Register-AzResourceProvider](Register-AzResourceProvider.md)
Registers a subscription with a resource provider.

### [Remove-AzADApplication](Remove-AzADApplication.md)
Delete an application.

### [Remove-AzADApplicationKeyCredential](Remove-AzADApplicationKeyCredential.md)
Removes a key credential associated with an application.

### [Remove-AzADApplicationOwner](Remove-AzADApplicationOwner.md)
Remove a member from owners.

### [Remove-AzADApplicationPasswordCredential](Remove-AzADApplicationPasswordCredential.md)
Removes a password credential associated with an application.

### [Remove-AzADGroup](Remove-AzADGroup.md)
Delete a group from the directory.

### [Remove-AzADGroupMember](Remove-AzADGroupMember.md)
Remove a member from a group.

### [Remove-AzADGroupOwner](Remove-AzADGroupOwner.md)
Remove a member from owners.

### [Remove-AzADServicePrincipal](Remove-AzADServicePrincipal.md)
Deletes a service principal from the directory.

### [Remove-AzADServicePrincipalKeyCredential](Remove-AzADServicePrincipalKeyCredential.md)
Removes a key credential associated with an service principal.

### [Remove-AzADServicePrincipalPasswordCredential](Remove-AzADServicePrincipalPasswordCredential.md)
Removes a password credential associated with an service principal.

### [Remove-AzADUser](Remove-AzADUser.md)
Delete a user.

### [Remove-AzDeployment](Remove-AzDeployment.md)
A template deployment that is currently running cannot be deleted.
Deleting a template deployment removes the associated deployment operations.
This is an asynchronous operation that returns a status of 202 until the template deployment is successfully deleted.
The Location response header contains the URI that is used to obtain the status of the process.
While the process is running, a call to the URI in the Location header returns a status of 202.
When the process finishes, the URI in the Location header returns a status of 204 on success.
If the asynchronous request failed, the URI in the Location header returns an error-level status code.

### [Remove-AzManagedApplication](Remove-AzManagedApplication.md)
Deletes the managed application.

### [Remove-AzManagedApplicationDefinition](Remove-AzManagedApplicationDefinition.md)
Deletes the managed application definition.

### [Remove-AzManagementGroup](Remove-AzManagementGroup.md)
Delete management group.
If a management group contains child resources, the request will fail.

### [Remove-AzManagementGroupSubscription](Remove-AzManagementGroupSubscription.md)
De-associates subscription from the management group.

### [Remove-AzPolicyAssignment](Remove-AzPolicyAssignment.md)
This operation deletes a policy assignment, given its name and the scope it was created in.
The scope of a policy assignment is the part of its ID preceding '/providers/Microsoft.Authorization/policyAssignments/{policyAssignmentName}'.

### [Remove-AzPolicyDefinition](Remove-AzPolicyDefinition.md)
This operation deletes the policy definition in the given subscription with the given name.

### [Remove-AzPolicySetDefinition](Remove-AzPolicySetDefinition.md)
This operation deletes the policy set definition in the given subscription with the given name.

### [Remove-AzResource](Remove-AzResource.md)
Deletes a resource.

### [Remove-AzResourceGroup](Remove-AzResourceGroup.md)
When you delete a resource group, all of its resources are also deleted.
Deleting a resource group deletes all of its template deployments and currently stored operations.

### [Remove-AzResourceLock](Remove-AzResourceLock.md)
Delete a management lock by scope.

### [Remove-AzRoleAssignment](Remove-AzRoleAssignment.md)
Deletes a role assignment.

### [Remove-AzRoleDefinition](Remove-AzRoleDefinition.md)
Deletes a role definition.

### [Remove-AzTag](Remove-AzTag.md)
You must remove all values from a resource tag before you can delete it.

### [Restore-AzADDeletedApplication](Restore-AzADDeletedApplication.md)
Restores the deleted application in the directory.

### [Set-AzManagedApplication](Set-AzManagedApplication.md)
Creates a new managed application.

### [Set-AzManagedApplicationDefinition](Set-AzManagedApplicationDefinition.md)
Creates a new managed application definition.

### [Set-AzManagementGroup](Set-AzManagementGroup.md)
Create or update a management group.
If a management group is already created and a subsequent create request is issued with different properties, the management group properties will be updated.

### [Set-AzPolicyDefinition](Set-AzPolicyDefinition.md)
This operation creates or updates a policy definition in the given subscription with the given name.

### [Set-AzPolicySetDefinition](Set-AzPolicySetDefinition.md)
This operation creates or updates a policy set definition in the given subscription with the given name.

### [Set-AzResource](Set-AzResource.md)
Creates a resource.

### [Set-AzResourceGroup](Set-AzResourceGroup.md)
Creates or updates a resource group.

### [Set-AzResourceLock](Set-AzResourceLock.md)
When you apply a lock at a parent scope, all child resources inherit the same lock.
To create management locks, you must have access to Microsoft.Authorization/* or Microsoft.Authorization/locks/* actions.
Of the built-in roles, only Owner and User Access Administrator are granted those actions.

### [Set-AzRoleDefinition](Set-AzRoleDefinition.md)
Creates or updates a role definition.

### [Stop-AzDeployment](Stop-AzDeployment.md)
You can cancel a deployment only if the provisioningState is Accepted or Running.
After the deployment is canceled, the provisioningState is set to Canceled.
Canceling a template deployment stops the currently running template deployment and leaves the resources partially deployed.

### [Test-AzADGroupMember](Test-AzADGroupMember.md)
Checks whether the specified user, group, contact, or service principal is a direct or transitive member of the specified group.

### [Test-AzDeployment](Test-AzDeployment.md)
Validates whether the specified template is syntactically correct and will be accepted by Azure Resource Manager..

### [Test-AzNameAvailability](Test-AzNameAvailability.md)
Checks if the specified management group name is valid and unique

### [Test-AzResourceGroup](Test-AzResourceGroup.md)
Checks whether a resource group exists.

### [Test-AzResourceMove](Test-AzResourceMove.md)
This operation checks whether the specified resources can be moved to the target.
The resources to move must be in the same source resource group.
The target resource group may be in a different subscription.
If validation succeeds, it returns HTTP response code 204 (no content).
If validation fails, it returns HTTP response code 409 (Conflict) with an error message.
Retrieve the URL in the Location header value to check the result of the long-running operation.

### [Unregister-AzResourceProvider](Unregister-AzResourceProvider.md)
Unregisters a subscription from a resource provider.

### [Update-AzADApplication](Update-AzADApplication.md)
Update an existing application.

### [Update-AzADServicePrincipal](Update-AzADServicePrincipal.md)
Updates a service principal in the directory.

### [Update-AzADUser](Update-AzADUser.md)
Updates a user.

### [Update-AzManagedApplication](Update-AzManagedApplication.md)
Updates an existing managed application.
The only value that can be updated via PATCH currently is the tags.

### [Update-AzManagementGroup](Update-AzManagementGroup.md)
Update a management group.

### [Update-AzResource](Update-AzResource.md)
Updates a resource.

### [Update-AzResourceGroup](Update-AzResourceGroup.md)
Resource groups can be updated through a simple PATCH operation to a group address.
The format of the request is the same as that for creating a resource group.
If a field is unspecified, the current value is retained.

