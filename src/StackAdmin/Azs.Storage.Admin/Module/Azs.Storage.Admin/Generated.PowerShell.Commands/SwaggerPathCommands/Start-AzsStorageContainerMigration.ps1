<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

<#
.SYNOPSIS
    Starts a container migration job to migrate containers to the specified destination share.

.DESCRIPTION
    Starts a container migration job to migrate containers to the specified destination share.

.PARAMETER StorageAccountName
    The name of storage account where the container locates.

.PARAMETER ContainerName
    The name of the container to be migrated.

.PARAMETER ShareName
    Name of the share containing the container specified for migration.

.PARAMETER ResourceGroupName
    The resource group name in which the storage resource provider was registered under.

.PARAMETER FarmName
    Farm Id.

.PARAMETER DestinationShareUncPath
    The UNC path of the destination share for migration.

.EXAMPLE

    PS C:\> Start-AzsStorageContainerMigration -StorageAccountName "accountTest" -ContainerName "containerTest" -ShareName "shareTest" -FarmName "10e8d576-d73c-454c-a40a-aee31a77a5f0" -DestinationShareUncPath "\\127.0.0.1\C$\Test"

#>
function Start-AzsStorageContainerMigration {
    [CmdletBinding(DefaultParameterSetName = 'Containers_Migrate')]
    param(
        [Parameter(Mandatory = $true, ParameterSetName = 'Containers_Migrate')]
        [string]
        $StorageAccountName,

        [Parameter(Mandatory = $true, ParameterSetName = 'Containers_Migrate')]
        [string]
        $ContainerName,

        [Parameter(Mandatory = $true, ParameterSetName = 'Containers_Migrate')]
        [System.String]
        $ShareName,

        [Parameter(Mandatory = $false, ParameterSetName = 'Containers_Migrate')]
        [System.String]
        $ResourceGroupName,

        [Parameter(Mandatory = $true, ParameterSetName = 'Containers_Migrate')]
        [System.String]
        $FarmName,

        [Parameter(Mandatory = $true, ParameterSetName = 'Containers_Migrate')]
        [string]
        $DestinationShareUncPath,

        [Parameter(Mandatory = $false)]
        [switch]
        $Wait
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
            FullClientTypeName = 'Microsoft.AzureStack.Management.Storage.Admin.StorageAdminClient'
        }

        $GlobalParameterHashtable = @{}
        $NewServiceClient_params['GlobalParameterHashtable'] = $GlobalParameterHashtable

        $GlobalParameterHashtable['SubscriptionId'] = $null
        if ($PSBoundParameters.ContainsKey('SubscriptionId')) {
            $GlobalParameterHashtable['SubscriptionId'] = $PSBoundParameters['SubscriptionId']
        }

        $StorageAdminClient = New-ServiceClient @NewServiceClient_params

        if (-not $PSBoundParameters.ContainsKey('ResourceGroupName')) {
            $ResourceGroupName = "System.$((Get-AzureRmLocation).Location)"
        }

        $flattenedParameters = @('ContainerName', 'StorageAccountName', 'DestinationShareUncPath')
        $utilityCmdParams = @{}
        $flattenedParameters | ForEach-Object {
            if ($PSBoundParameters.ContainsKey($_)) {
                $utilityCmdParams[$_] = $PSBoundParameters[$_]
            }
        }
        $MigrationParameters = New-MigrationParametersObject @utilityCmdParams



        if ('Containers_Migrate' -eq $PsCmdlet.ParameterSetName) {
            Write-Verbose -Message 'Performing operation MigrateWithHttpMessagesAsync on $StorageAdminClient.'
            $TaskResult = $StorageAdminClient.Containers.MigrateWithHttpMessagesAsync($ResourceGroupName, $FarmName, $ShareName, $MigrationParameters)
        } else {
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
        if ($Wait) {
            Invoke-Command -ScriptBlock $PSSwaggerJobScriptBlock `
                -ArgumentList $TaskResult, $TaskHelperFilePath `
                @PSCommonParameters
        } else {
            $ScriptBlockParameters = New-Object -TypeName 'System.Collections.Generic.Dictionary[string,object]'
            $ScriptBlockParameters['TaskResult'] = $TaskResult
            $ScriptBlockParameters['AsJob'] = $true
            $ScriptBlockParameters['TaskHelperFilePath'] = $TaskHelperFilePath
            $PSCommonParameters.GetEnumerator() | ForEach-Object { $ScriptBlockParameters[$_.Name] = $_.Value }

            Start-PSSwaggerJobHelper -ScriptBlock $PSSwaggerJobScriptBlock `
                -CallerPSBoundParameters $ScriptBlockParameters `
                -CallerPSCmdlet $PSCmdlet `
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

