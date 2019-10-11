<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

<#
.SYNOPSIS
    Parameters for bootstrap action

.DESCRIPTION
    Parameters for bootstrap action

.PARAMETER Duration
    Duration in TimeSpan format(Define which ISO format)

#>
function New-UnlockActionParametersObject {
    param(    
        [Parameter(Mandatory = $false)]
        [string]
        $Duration
    )
    
    $Object = New-Object -TypeName Microsoft.AzureStack.Management.Deployment.Admin.Models.UnlockActionParameters -ArgumentList @($duration)

    if (Get-Member -InputObject $Object -Name Validate -MemberType Method) {
        $Object.Validate()
    }

    return $Object
}

