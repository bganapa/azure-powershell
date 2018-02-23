<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

<#
.SYNOPSIS
    Gets the available gallery admin operations.

.DESCRIPTION
    

#>
function Get-Operation
{
    [OutputType([Microsoft.AzureStack.Management.Gallery.Admin.Models.Operation])]
    [CmdletBinding(DefaultParameterSetName='ListOperations')]
    param(
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

    $NewServiceClient_params = @{
        FullClientTypeName = 'Microsoft.AzureStack.Management.Gallery.Admin.GalleryAdminClient'
    }

    $GlobalParameterHashtable = @{}
    $NewServiceClient_params['GlobalParameterHashtable'] = $GlobalParameterHashtable

    $GalleryAdminClient = New-ServiceClient @NewServiceClient_params


    if ('ListOperations' -eq $PsCmdlet.ParameterSetName) {
        Write-Verbose -Message 'Performing operation ListOperationsWithHttpMessagesAsync on $GalleryAdminClient.'
        $TaskResult = $GalleryAdminClient.ListOperationsWithHttpMessagesAsync()
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

