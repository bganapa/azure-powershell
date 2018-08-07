<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

<#
.SYNOPSIS
    

.DESCRIPTION
    Add a new scale unit.

.PARAMETER AwaitStorageConvergence
    Flag indicates if the operation should wait for storage to converge before returning.

.PARAMETER NodeList
    List of nodes in the scale unit.

.PARAMETER ResourceGroupName
    Name of the resource group.

.PARAMETER ScaleUnit
    Name of the scale units.

.PARAMETER Location
    Location of the resource.

#>
function Add-AzsScaleUnitNode {
    [CmdletBinding(DefaultParameterSetName = 'ScaleUnits_ScaleOut')]
    param(    
        [Parameter(Mandatory = $false, ParameterSetName = 'ScaleUnits_ScaleOut')]
        [switch]
        $AwaitStorageConvergence,
    
        [Parameter(Mandatory = $false, ParameterSetName = 'ScaleUnits_ScaleOut')]
        [Microsoft.AzureStack.Management.Fabric.Admin.Models.ScaleOutScaleUnitParameters[]]
        $NodeList,
    
        [Parameter(Mandatory = $false, ParameterSetName = 'ScaleUnits_ScaleOut')]
        [ValidateLength(1, 90)]
        [System.String]
        $ResourceGroupName,
    
        [Parameter(Mandatory = $true, ParameterSetName = 'ScaleUnits_ScaleOut')]
        [System.String]
        $ScaleUnit,
    
        [Parameter(Mandatory = $false, ParameterSetName = 'ScaleUnits_ScaleOut')]
        [System.String]
        $Location,

        [Parameter(Mandatory = $false)]
        [switch]
        $AsJob
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

        $NewServiceClient_params = @{
            FullClientTypeName = 'Microsoft.AzureStack.Management.Fabric.Admin.FabricAdminClient'
        }

        $GlobalParameterHashtable = @{}
        $NewServiceClient_params['GlobalParameterHashtable'] = $GlobalParameterHashtable
     
        $GlobalParameterHashtable['SubscriptionId'] = $null
        if ($PSBoundParameters.ContainsKey('SubscriptionId')) {
            $GlobalParameterHashtable['SubscriptionId'] = $PSBoundParameters['SubscriptionId']
        }

        $FabricAdminClient = New-ServiceClient @NewServiceClient_params

        $flattenedParameters = @('NodeList', 'AwaitStorageConvergence')
        $utilityCmdParams = @{}
        $flattenedParameters | ForEach-Object {
            if ($PSBoundParameters.ContainsKey($_)) {
                $utilityCmdParams[$_] = $PSBoundParameters[$_]
            }
        }
        $NodeListObject = New-ScaleOutScaleUnitParametersListObject @utilityCmdParams

        if ([System.String]::IsNullOrEmpty($Location)) {
            $Location = (Get-AzureRMLocation).Location
        }
        if ([System.String]::IsNullOrEmpty($ResourceGroupName)) {
            $ResourceGroupName = "System.$Location"
        }

        if ('ScaleUnits_ScaleOut' -eq $PsCmdlet.ParameterSetName) {
            Write-Verbose -Message 'Performing operation ScaleOutWithHttpMessagesAsync on $FabricAdminClient.'
            $TaskResult = $FabricAdminClient.ScaleUnits.ScaleOutWithHttpMessagesAsync($ResourceGroupName, $Location, $ScaleUnit, $NodeListObject)
        }
        else {
            Write-Verbose -Message 'Failed to map parameter set to operation method.'
            throw 'Module failed to find operation to execute.'
        }

        Write-Verbose -Message "Waiting for the operation to complete."

        $PSSwaggerJobScriptBlock = {
            [CmdletBinding()]
            param(    
                [Parameter(Mandatory = $true)]
                [System.Threading.Tasks.Task]
                $TaskResult,

                [Parameter(Mandatory = $true)]
                [string]
                $TaskHelperFilePath
            )
            if ($TaskResult) {
                . $TaskHelperFilePath
                $GetTaskResult_params = @{
                    TaskResult = $TaskResult
                }
            
                Get-TaskResult @GetTaskResult_params
            
            }
        }

        $PSCommonParameters = Get-PSCommonParameter -CallerPSBoundParameters $PSBoundParameters
        $TaskHelperFilePath = Join-Path -Path $ExecutionContext.SessionState.Module.ModuleBase -ChildPath 'Get-TaskResult.ps1'
        if ($AsJob) {
            $ScriptBlockParameters = New-Object -TypeName 'System.Collections.Generic.Dictionary[string,object]'
            $ScriptBlockParameters['TaskResult'] = $TaskResult
            $ScriptBlockParameters['AsJob'] = $AsJob
            $ScriptBlockParameters['TaskHelperFilePath'] = $TaskHelperFilePath
            $PSCommonParameters.GetEnumerator() | ForEach-Object { $ScriptBlockParameters[$_.Name] = $_.Value }

            Start-PSSwaggerJobHelper -ScriptBlock $PSSwaggerJobScriptBlock `
                -CallerPSBoundParameters $ScriptBlockParameters `
                -CallerPSCmdlet $PSCmdlet `
                @PSCommonParameters
        }
        else {
            Invoke-Command -ScriptBlock $PSSwaggerJobScriptBlock `
                -ArgumentList $TaskResult, $TaskHelperFilePath `
                @PSCommonParameters
        }
    }

    End {
        if ($tracerObject) {
            $global:DebugPreference = $oldDebugPreference
            Unregister-PSSwaggerClientTracing -TracerObject $tracerObject
        }
    }
}

