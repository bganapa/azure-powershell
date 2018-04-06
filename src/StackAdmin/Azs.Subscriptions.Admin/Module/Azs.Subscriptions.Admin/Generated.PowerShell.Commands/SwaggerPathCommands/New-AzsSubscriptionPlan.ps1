<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

<#
.SYNOPSIS
    Creates a subscription plan.

.DESCRIPTION
    Creates a subscription plan.

.PARAMETER AcquisitionId
    Acquisition identifier.

.PARAMETER PlanId
    Plan identifier in the tenant subscription context.

.PARAMETER TargetSubscriptionId
    The target subscription ID.

.EXAMPLE

    New-AzsSubscriptionPlan -PlanId "/subscriptions/0a823c45-d9e7-4812-a138-74e22213693a/resourceGroups/rg1/providers/Microsoft.Subscriptions.Admin/plans/plan1" -AcquisitionId $([Guid]::NewGuid()) -TargetSubscriptionId "c90173b1-de7a-4b1d-8600-b832b0e65946"

    Create an subscription plan.
#>
function New-AzsSubscriptionPlan {
    [OutputType([Microsoft.AzureStack.Management.Subscriptions.Admin.Models.PlanAcquisition])]
    [CmdletBinding(DefaultParameterSetName = 'Create')]
    param(
        [Parameter(Mandatory = $false, ParameterSetName = 'Create')]
        [ValidateNotNull()]
        [System.Guid]
        $AcquisitionId,

        [Parameter(Mandatory = $true, ParameterSetName = 'Create')]
        [ValidateNotNull()]
        [System.String]
        $PlanId,

        [Parameter(Mandatory = $true, ParameterSetName = 'Create')]
        [ValidateNotNull()]
        [System.Guid]
        $TargetSubscriptionId
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
            FullClientTypeName = 'Microsoft.AzureStack.Management.Subscriptions.Admin.SubscriptionsAdminClient'
        }

        $GlobalParameterHashtable = @{}
        $NewServiceClient_params['GlobalParameterHashtable'] = $GlobalParameterHashtable

        $GlobalParameterHashtable['SubscriptionId'] = $null
        if ($PSBoundParameters.ContainsKey('SubscriptionId')) {
            $GlobalParameterHashtable['SubscriptionId'] = $PSBoundParameters['SubscriptionId']
        }

        $SubscriptionsAdminClient = New-ServiceClient @NewServiceClient_params

        if (-not $PSBoundParameters.ContainsKey('AcquisitionId')) {
            $AcquisitionId = [Guid]::NewGuid().ToString()
            $PSBoundParameters.Add("AcquisitionId", $AcquisitionId)
        }


        $flattenedParameters = @('PlanId', 'AcquisitionId')
        $utilityCmdParams = @{}
        $flattenedParameters | ForEach-Object {
            if ($PSBoundParameters.ContainsKey($_)) {
                $utilityCmdParams[$_] = $PSBoundParameters[$_]
            }
        }

        $NewAcquiredPlan = New-PlanAcquisitionPropertiesObject @utilityCmdParams

        if ('Create' -eq $PsCmdlet.ParameterSetName) {
            Write-Verbose -Message 'Performing operation CreateWithHttpMessagesAsync on $SubscriptionsAdminClient.'
            $TaskResult = $SubscriptionsAdminClient.AcquiredPlans.CreateWithHttpMessagesAsync($TargetSubscriptionId.ToString(), $AcquisitionId.ToString(), $NewAcquiredPlan)
        } else {
            Write-Verbose -Message 'Failed to map parameter set to operation method.'
            throw 'Module failed to find operation to execute.'
        }

        if ($TaskResult) {
            $GetTaskResult_params = @{
                TaskResult = $TaskResult
            }
            Get-TaskResult @GetTaskResult_params
        }
    }

    End {
        if ($tracerObject) {
            $global:DebugPreference = $oldDebugPreference
            Unregister-PSSwaggerClientTracing -TracerObject $tracerObject
        }
    }
}
