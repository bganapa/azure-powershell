<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

<#
.SYNOPSIS
    Parameters for deploy action

.DESCRIPTION
    Parameters for deploy action

.PARAMETER Version
    Generic Version object

.PARAMETER Parameters
    Deployment parameters, value in JToken

#>
function New-DeployActionParametersObject {
    param(    
        [Parameter(Mandatory = $false)]
        [string]
        $Version,
    
        [Parameter(Mandatory = $false)]
        [string]
        $Parameters
    )
    
    $Object = New-Object -TypeName Microsoft.AzureStack.Management.Deployment.Admin.Models.DeployActionParameters -ArgumentList @($version, $parameters)

    if (Get-Member -InputObject $Object -Name Validate -MemberType Method) {
        $Object.Validate()
    }

    return $Object
}

