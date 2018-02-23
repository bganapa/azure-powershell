<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

<#
.SYNOPSIS
    Uploads a provider gallery item to the storage.

.DESCRIPTION
    

.PARAMETER GalleryItemUri
    The URI to the gallery item JSON file.

#>
function New-GalleryItem
{
    [OutputType([Microsoft.AzureStack.Management.Gallery.Admin.Models.GalleryItem])]
    [CmdletBinding(DefaultParameterSetName='GalleryItems_Create')]
    param(    
        [Parameter(Mandatory = $true, ParameterSetName = 'GalleryItems_Create')]
        [System.String]
        $GalleryItemUri
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


    if ('GalleryItems_Create' -eq $PsCmdlet.ParameterSetName) {
        Write-Verbose -Message 'Performing operation CreateWithHttpMessagesAsync on $GalleryAdminClient.'
        $TaskResult = $GalleryAdminClient.GalleryItems.CreateWithHttpMessagesAsync($(if ($PSBoundParameters.ContainsKey('GalleryItemUri')) { $GalleryItemUri } else { [NullString]::Value }))
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

