<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

<#
.SYNOPSIS
    Updates the specified plan

.DESCRIPTION
    Updates the specified plan

.PARAMETER ResourceGroupName
    The resource group the resource is located under.

.PARAMETER DisplayName
    Display name.

.PARAMETER ResourceId
    The resource id.

.PARAMETER QuotaIds
    Quota identifiers under the plan.

.PARAMETER InputObject
    The input object of type Microsoft.AzureStack.Management.Subscriptions.Admin.Models.Plan.

.PARAMETER SkuIds
    SKU identifiers.

.PARAMETER ExternalReferenceId
    External reference identifier.

.PARAMETER Description
    Description of the plan.

.PARAMETER Location
    Location of the resource.

.PARAMETER Name
    Name of the plan.

.PARAMETER SubscriptionCount
    Subscription count.

.EXAMPLE

    PS C:\> Set-AzsPlan -Name "plan1" -ResourceGroupName "rg1" -Description "This plan is meant to be used by accounting only."

    Updates the specified plan

#>
function Set-AzsPlan
{
    [OutputType([Microsoft.AzureStack.Management.Subscriptions.Admin.Models.Plan])]
    [CmdletBinding(DefaultParameterSetName='Update')]
    param(
        [Parameter(Mandatory = $true, ParameterSetName = 'Update')]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $Name,

        [Parameter(Mandatory = $true, ParameterSetName = 'Update')]
        [Parameter(Mandatory = $false, ParameterSetName = 'InputObject')]
        [ValidateLength(1, 90)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $ResourceGroupName,

        [Parameter(Mandatory = $false, ParameterSetName = 'Update')]
        [Parameter(Mandatory = $false, ParameterSetName = 'ResourceId')]
        [Parameter(Mandatory = $false, ParameterSetName = 'InputObject')]
        [string]
        $DisplayName,

        [Parameter(Mandatory = $false, ParameterSetName = 'Update')]
        [Parameter(Mandatory = $false, ParameterSetName = 'ResourceId')]
        [Parameter(Mandatory = $false, ParameterSetName = 'InputObject')]
        [string[]]
        $QuotaIds,

        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'InputObject')]
        [ValidateNotNullOrEmpty()]
        [Microsoft.AzureStack.Management.Subscriptions.Admin.Models.Plan]
        $InputObject,

        [Parameter(Mandatory = $false, ParameterSetName = 'Update')]
        [Parameter(Mandatory = $false, ParameterSetName = 'ResourceId')]
        [Parameter(Mandatory = $false, ParameterSetName = 'InputObject')]
        [string[]]
        $SkuIds,

        [Parameter(Mandatory = $false, ParameterSetName = 'Update')]
        [Parameter(Mandatory = $false, ParameterSetName = 'ResourceId')]
        [Parameter(Mandatory = $false, ParameterSetName = 'InputObject')]
        [string]
        $ExternalReferenceId,

        [Parameter(Mandatory = $false, ParameterSetName = 'Update')]
        [Parameter(Mandatory = $false, ParameterSetName = 'ResourceId')]
        [Parameter(Mandatory = $false, ParameterSetName = 'InputObject')]
        [string]
        $Description,

        [Parameter(Mandatory = $false, ParameterSetName = 'Update')]
        [Parameter(Mandatory = $false, ParameterSetName = 'ResourceId')]
        [Parameter(Mandatory = $false, ParameterSetName = 'InputObject')]
        [Alias('ArmLocation')]
        [string]
        $Location,

        [Parameter(Mandatory = $false, ParameterSetName = 'Update')]
        [Parameter(Mandatory = $false, ParameterSetName = 'ResourceId')]
        [Parameter(Mandatory = $false, ParameterSetName = 'InputObject')]
        [int64]
        $SubscriptionCount,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'ResourceId')]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $ResourceId
    )

    Begin
    {
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

    if ($PSBoundParameters.ContainsKey('Location')) {
        if( $MyInvocation.Line -match "\s-ArmLocation\s")
        {
            Write-Warning -Message "The parameter alias ArmLocation will be deprecated in future release. Please use the parameter Location instead"
        }
    }

    $NewServiceClient_params = @{
        FullClientTypeName = 'Microsoft.AzureStack.Management.Subscriptions.Admin.SubscriptionsAdminClient'
    }

    $GlobalParameterHashtable = @{}
    $NewServiceClient_params['GlobalParameterHashtable'] = $GlobalParameterHashtable

    $GlobalParameterHashtable['SubscriptionId'] = $null
    if($PSBoundParameters.ContainsKey('SubscriptionId')) {
        $GlobalParameterHashtable['SubscriptionId'] = $PSBoundParameters['SubscriptionId']
    }

    $SubscriptionsAdminClient = New-ServiceClient @NewServiceClient_params

    if (-not $PSBoundParameters.ContainsKey('Location'))
    {
         $Location = (Get-AzureRMLocation).Location
         $PSBoundParameters.Add("Location", $Location)
    }

    $flattenedParameters = @('Description', 'SkuIds', 'ExternalReferenceId', 'DisplayName', 'Name', 'Location', 'QuotaIds', 'SubscriptionCount')
    $utilityCmdParams = @{}
    $flattenedParameters | ForEach-Object {
        if($PSBoundParameters.ContainsKey($_)) {
            $utilityCmdParams[$_] = $PSBoundParameters[$_]
        }
    }
    $NewPlan = New-PlanObject @utilityCmdParams


    $Plan = $Name


    if('InputObject' -eq $PsCmdlet.ParameterSetName -or 'ResourceId' -eq $PsCmdlet.ParameterSetName) {
        $GetArmResourceIdParameterValue_params = @{
            IdTemplate = '/subscriptions/{subscriptionId}/resourcegroups/{resourceGroupName}/providers/Microsoft.Subscriptions.Admin/plans/{plan}'
        }

        if('ResourceId' -eq $PsCmdlet.ParameterSetName) {
            $GetArmResourceIdParameterValue_params['Id'] = $ResourceId
        }
        else {
            $GetArmResourceIdParameterValue_params['Id'] = $InputObject.Id
            $NewPlan = $InputObject
        }
        $ArmResourceIdParameterValues = Get-ArmResourceIdParameterValue @GetArmResourceIdParameterValue_params
        $resourceGroupName = $ArmResourceIdParameterValues['resourceGroupName']

        $plan = $ArmResourceIdParameterValues['plan']
    }


    if ('Update' -eq $PsCmdlet.ParameterSetName -or 'InputObject' -eq $PsCmdlet.ParameterSetName -or 'ResourceId' -eq $PsCmdlet.ParameterSetName) {
        Write-Verbose -Message 'Performing operation CreateOrUpdateWithHttpMessagesAsync on $SubscriptionsAdminClient.'
        $TaskResult = $SubscriptionsAdminClient.Plans.CreateOrUpdateWithHttpMessagesAsync($ResourceGroupName, $Plan, $NewPlan)
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

