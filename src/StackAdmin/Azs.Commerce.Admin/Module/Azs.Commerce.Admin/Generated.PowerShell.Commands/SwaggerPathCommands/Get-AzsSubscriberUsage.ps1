<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

<#
.SYNOPSIS
    Gets a collection of SubscriberUsageAggregates, which are UsageAggregates from users.

.DESCRIPTION
    Gets a collection of SubscriberUsageAggregates, which are UsageAggregates from users.

.PARAMETER SubscriberId
    The tenant subscription identifier.

.PARAMETER ReportedStartTime
    The reported start time (inclusive).

.PARAMETER AggregationGranularity
    The aggregation granularity.

.PARAMETER Skip
    Skip the first N items as specified by the parameter value.

.PARAMETER ReportedEndTime
    The reported end time (exclusive).

.PARAMETER ContinuationToken
    The continuation token.

.PARAMETER Top
    Return the top N items as specified by the parameter value. Applies after the -Skip parameter.

#>
function Get-AzsSubscriberUsage {
    [OutputType([Microsoft.AzureStack.Management.Commerce.Admin.Models.UsageAggregate])]
    [CmdletBinding(DefaultParameterSetName = 'SubscriberUsageAggregates_List')]
    param(
        [Parameter(Mandatory = $false, ParameterSetName = 'SubscriberUsageAggregates_List')]
        [System.String]
        $SubscriberId,

        [Parameter(Mandatory = $true, ParameterSetName = 'SubscriberUsageAggregates_List')]
        [System.DateTime]
        $ReportedStartTime,

        [Parameter(Mandatory = $false, ParameterSetName = 'SubscriberUsageAggregates_List')]
        [System.String]
        [ValidateSet("Daily","Hourly")]
        $AggregationGranularity,

        [Parameter(Mandatory = $false, ParameterSetName = 'SubscriberUsageAggregates_List')]
        [int]
        $Skip = -1,

        [Parameter(Mandatory = $true, ParameterSetName = 'SubscriberUsageAggregates_List')]
        [System.DateTime]
        $ReportedEndTime,

        [Parameter(Mandatory = $false, ParameterSetName = 'SubscriberUsageAggregates_List')]
        [System.String]
        $ContinuationToken,

        [Parameter(Mandatory = $false, ParameterSetName = 'SubscriberUsageAggregates_List')]
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
            FullClientTypeName = 'Microsoft.AzureStack.Management.Commerce.Admin.CommerceAdminClient'
        }

        $GlobalParameterHashtable = @{}
        $NewServiceClient_params['GlobalParameterHashtable'] = $GlobalParameterHashtable

        $GlobalParameterHashtable['SubscriptionId'] = $null
        if ($PSBoundParameters.ContainsKey('SubscriptionId')) {
            $GlobalParameterHashtable['SubscriptionId'] = $PSBoundParameters['SubscriptionId']
        }

        $CommerceAdminClient = New-ServiceClient @NewServiceClient_params

        if ('SubscriberUsageAggregates_List' -eq $PsCmdlet.ParameterSetName) {
            Write-Verbose -Message 'Performing operation ListWithHttpMessagesAsync on $CommerceAdminClient.'
            $TaskResult = $CommerceAdminClient.SubscriberUsageAggregates.ListWithHttpMessagesAsync($ReportedStartTime, $ReportedEndTime, $(if ($PSBoundParameters.ContainsKey('AggregationGranularity')) {
                        $AggregationGranularity
                    } else {
                        [NullString]::Value
                    }), $(if ($PSBoundParameters.ContainsKey('SubscriberId')) {
                        $SubscriberId
                    } else {
                        [NullString]::Value
                    }), $(if ($PSBoundParameters.ContainsKey('ContinuationToken')) {
                        $ContinuationToken
                    } else {
                        [NullString]::Value
                    }))
        } else {
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
            $GetTaskResult_params['PageType'] = 'Microsoft.Rest.Azure.IPage[Microsoft.AzureStack.Management.Commerce.Admin.Models.UsageAggregate]' -as [Type]
            Get-TaskResult @GetTaskResult_params

            Write-Verbose -Message 'Flattening paged results.'
            while ($PageResult -and $PageResult.Result -and (Get-Member -InputObject $PageResult.Result -Name 'nextLink') -and $PageResult.Result.'nextLink' -and (($TopInfo -eq $null) -or ($TopInfo.Max -eq -1) -or ($TopInfo.Count -lt $TopInfo.Max))) {
                $PageResult.Result = $null
                Write-Debug -Message "Retrieving next page: $($PageResult.Result.'nextLink')"
                $TaskResult = $CommerceAdminClient.SubscriberUsageAggregates.ListNextWithHttpMessagesAsync($PageResult.Result.'nextLink')
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

