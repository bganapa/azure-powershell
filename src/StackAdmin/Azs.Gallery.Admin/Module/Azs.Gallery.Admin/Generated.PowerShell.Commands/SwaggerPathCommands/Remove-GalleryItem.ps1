<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

<#
.SYNOPSIS
    Delete a specific gallery item.

.DESCRIPTION
    

.PARAMETER GalleryItemName
    Identity of the gallery item. Includes publisher name, item name, and may include version separated by period character.

#>
function Remove-GalleryItem
{
    [CmdletBinding(DefaultParameterSetName='GalleryItems_Delete')]
    param(    
        [Parameter(Mandatory = $true, ParameterSetName = 'GalleryItems_Delete')]
        [System.String]
        $GalleryItemName
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
     
    $GlobalParameterHashtable['SubscriptionId'] = $null
    if($PSBoundParameters.ContainsKey('SubscriptionId')) {
        $GlobalParameterHashtable['SubscriptionId'] = $PSBoundParameters['SubscriptionId']
    }

    $GalleryAdminClient = New-ServiceClient @NewServiceClient_params


    if ('GalleryItems_Delete' -eq $PsCmdlet.ParameterSetName) {
        Write-Verbose -Message 'Performing operation DeleteWithHttpMessagesAsync on $GalleryAdminClient.'
        $TaskResult = $GalleryAdminClient.GalleryItems.DeleteWithHttpMessagesAsync($GalleryItemName)
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

