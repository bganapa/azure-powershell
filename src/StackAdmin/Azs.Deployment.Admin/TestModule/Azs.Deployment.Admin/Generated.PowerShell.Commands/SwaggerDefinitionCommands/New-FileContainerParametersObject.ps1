<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

<#
.SYNOPSIS
    Parameters for creating a new file container.

.DESCRIPTION
    Parameters for creating a new file container.

.PARAMETER SourceUri
    Specifies The remote file location.

.PARAMETER PostCopyAction
    Specifies the file post copy action.

#>
function New-FileContainerParametersObject {
    param(    
        [Parameter(Mandatory = $false)]
        [string]
        $SourceUri,
    
        [Parameter(Mandatory = $false)]
        [ValidateSet('None', 'Unzip')]
        [string]
        $PostCopyAction
    )
    
    $Object = New-Object -TypeName Microsoft.AzureStack.Management.Deployment.Admin.Models.FileContainerParameters -ArgumentList @($postCopyAction, $sourceUri)

    if (Get-Member -InputObject $Object -Name Validate -MemberType Method) {
        $Object.Validate()
    }

    return $Object
}

