<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

<#
.SYNOPSIS
    

.DESCRIPTION
    Lists the action plan operations

.PARAMETER PlanId
    Identifier of the action plan.

.PARAMETER Skip
    Skip the first N items as specified by the parameter value.

.PARAMETER Name
    Identifier of the action plan operation.

.PARAMETER ResourceId
    The resource id.

.PARAMETER InputObject
    The input object of type Microsoft.AzureStack.Management.Deployment.Admin.Models.ActionPlanOperationResourceEntity.

.PARAMETER Top
    Return the top N items as specified by the parameter value. Applies after the -Skip parameter.

#>
function Get-ActionPlanOperation {
    [OutputType([Microsoft.AzureStack.Management.Deployment.Admin.Models.ActionPlanOperationResourceEntity])]
    [CmdletBinding(DefaultParameterSetName = 'ActionPlanOperation_List')]
    param(    
        [Parameter(Mandatory = $true, ParameterSetName = 'ActionPlanOperation_List')]
        [Parameter(Mandatory = $true, ParameterSetName = 'ActionPlanOperation_Get')]
        [System.String]
        $PlanId,
    
        [Parameter(Mandatory = $false, ParameterSetName = 'ActionPlanOperation_List')]
        [int]
        $Skip = -1,
    
        [Parameter(Mandatory = $true, ParameterSetName = 'ActionPlanOperation_Get')]
        [Alias('OperationId')]
        [System.String]
        $Name,
    
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'ResourceId_ActionPlanOperation_Get')]
        [System.String]
        $ResourceId,
    
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'InputObject_ActionPlanOperation_Get')]
        [Microsoft.AzureStack.Management.Deployment.Admin.Models.ActionPlanOperationResourceEntity]
        $InputObject,
    
        [Parameter(Mandatory = $false, ParameterSetName = 'ActionPlanOperation_List')]
        [int]
        $Top = -1
    )

    Begin {
        Initialize-PSSwaggerDependencies -Azure
        $tracerObject = $null
        if (('continue' -eq $DebugPreference) -or ('inquire' -eq $DebugPreference)) {
            $oldDebugPreference = $global:DebugPreference
            $global:DebugPreference = "continue"
            $tracerObject = New-PSSwaggerClientTracing
            Register-PSSwaggerClientTracing -TracerObject $tracerObject
        }
    }

    Process {
    
        $ErrorActionPreference = 'Stop'

        $NewServiceClient_params = @{
            FullClientTypeName = 'Microsoft.AzureStack.Management.Deployment.Admin.DeploymentAdminClient'
        }

        $GlobalParameterHashtable = @{ }
        $NewServiceClient_params['GlobalParameterHashtable'] = $GlobalParameterHashtable
     
        $GlobalParameterHashtable['SubscriptionId'] = $null
        if ($PSBoundParameters.ContainsKey('SubscriptionId')) {
            $GlobalParameterHashtable['SubscriptionId'] = $PSBoundParameters['SubscriptionId']
        }

        $DeploymentAdminClient = New-ServiceClient @NewServiceClient_params

        $OperationId = $Name

 
        if ('InputObject_ActionPlanOperation_Get' -eq $PsCmdlet.ParameterSetName -or 'ResourceId_ActionPlanOperation_Get' -eq $PsCmdlet.ParameterSetName) {
            $GetArmResourceIdParameterValue_params = @{
                IdTemplate = '/subscriptions/{subscriptionId}/providers/Microsoft.Deployment.Admin/locations/global/actionPlans/{planId}/operations/{operationId}'
            }

            if ('ResourceId_ActionPlanOperation_Get' -eq $PsCmdlet.ParameterSetName) {
                $GetArmResourceIdParameterValue_params['Id'] = $ResourceId
            }
            else {
                $GetArmResourceIdParameterValue_params['Id'] = $InputObject.Id
            }
            $ArmResourceIdParameterValues = Get-ArmResourceIdParameterValue @GetArmResourceIdParameterValue_params
            $planId = $ArmResourceIdParameterValues['planId']

            $operationId = $ArmResourceIdParameterValues['operationId']
        }

        $filterInfos = @(
            @{
                'Type'     = 'powershellWildcard'
                'Value'    = $OperationId
                'Property' = 'Name' 
            })
        $applicableFilters = Get-ApplicableFilters -Filters $filterInfos
        if ($applicableFilters | Where-Object { $_.Strict }) {
            Write-Verbose -Message 'Performing server-side call ''Get-ActionPlanOperation -'''
            $serverSideCall_params = @{

            }

            $serverSideResults = Get-ActionPlanOperation @serverSideCall_params
            foreach ($serverSideResult in $serverSideResults) {
                $valid = $true
                foreach ($applicableFilter in $applicableFilters) {
                    if (-not (Test-FilteredResult -Result $serverSideResult -Filter $applicableFilter.Filter)) {
                        $valid = $false
                        break
                    }
                }

                if ($valid) {
                    $serverSideResult
                }
            }
            return
        }
        if ('ActionPlanOperation_List' -eq $PsCmdlet.ParameterSetName) {
            Write-Verbose -Message 'Performing operation ListWithHttpMessagesAsync on $DeploymentAdminClient.'
            $TaskResult = $DeploymentAdminClient.ActionPlanOperation.ListWithHttpMessagesAsync($PlanId)
        }
        elseif ('ActionPlanOperation_Get' -eq $PsCmdlet.ParameterSetName -or 'InputObject_ActionPlanOperation_Get' -eq $PsCmdlet.ParameterSetName -or 'ResourceId_ActionPlanOperation_Get' -eq $PsCmdlet.ParameterSetName) {
            Write-Verbose -Message 'Performing operation GetWithHttpMessagesAsync on $DeploymentAdminClient.'
            $TaskResult = $DeploymentAdminClient.ActionPlanOperation.GetWithHttpMessagesAsync($PlanId, $OperationId)
        }
        else {
            Write-Verbose -Message 'Failed to map parameter set to operation method.'
            throw 'Module failed to find operation to execute.'
        }

        if ($TaskResult) {
            $GetTaskResult_params = @{
                TaskResult = $TaskResult
            }

            $TopInfo = @{
                'Count' = 0
                'Max'   = $Top
            }
            $GetTaskResult_params['TopInfo'] = $TopInfo 
            $SkipInfo = @{
                'Count' = 0
                'Max'   = $Skip
            }
            $GetTaskResult_params['SkipInfo'] = $SkipInfo 
            $PageResult = @{
                'Result' = $null
            }
            $GetTaskResult_params['PageResult'] = $PageResult 
            $GetTaskResult_params['PageType'] = 'Microsoft.Rest.Azure.IPage[Microsoft.AzureStack.Management.Deployment.Admin.Models.ActionPlanOperationResourceEntity]' -as [Type]            
            Get-TaskResult @GetTaskResult_params
            
            Write-Verbose -Message 'Flattening paged results.'
            while ($PageResult -and $PageResult.Result -and (Get-Member -InputObject $PageResult.Result -Name 'nextLink') -and $PageResult.Result.'nextLink' -and (($TopInfo -eq $null) -or ($TopInfo.Max -eq -1) -or ($TopInfo.Count -lt $TopInfo.Max))) {
                $PageResult.Result = $null
                Write-Debug -Message "Retrieving next page: $($PageResult.Result.'nextLink')"
                $TaskResult = $DeploymentAdminClient.ActionPlanOperation.ListNextWithHttpMessagesAsync($PageResult.Result.'nextLink')
                $GetTaskResult_params['TaskResult'] = $TaskResult
                $GetTaskResult_params['PageResult'] = $PageResult
                Get-TaskResult @GetTaskResult_params
            }
        }
    }

    End {
        if ($tracerObject) {
            $global:DebugPreference = $oldDebugPreference
            Unregister-PSSwaggerClientTracing -TracerObject $tracerObject
        }
    }
}

