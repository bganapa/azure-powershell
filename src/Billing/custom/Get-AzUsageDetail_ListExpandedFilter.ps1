function Get-AzUsageDetail_ListExpandedFilter {
    [Alias('Get-AzConsumptionUsageDetail')]
    [OutputType('Microsoft.Azure.PowerShell.Cmdlets.Billing.Models.Api20181001.IUsageDetail')]
    [CmdletBinding(DefaultParameterSetName='ListExpandedFilter', PositionalBinding=$false)]
    [Microsoft.Azure.PowerShell.Cmdlets.Billing.Profile('latest-2019-04-30')]
    [Microsoft.Azure.PowerShell.Cmdlets.Billing.Description('Lists the usage details for the defined scope. Usage details are available via this API only for May 1, 2014 or later.')]
    param(
        [Parameter(Mandatory, HelpMessage='The scope associated with usage details operations. This includes ''/subscriptions/{subscriptionId}/'' for subscription scope, ''/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}'' for resourceGroup scope, ''/providers/Microsoft.Billing/billingAccounts/{billingAccountId}'' for Billing Account scope, ''/providers/Microsoft.Billing/departments/{departmentId}'' for Department scope, ''/providers/Microsoft.Billing/enrollmentAccounts/{enrollmentAccountId}'' for EnrollmentAccount scope and ''/providers/Microsoft.Management/managementGroups/{managementGroupId}'' for Management Group scope. For subscription, billing account, department, enrollment account and management group, you can also add billing period to the scope using ''/providers/Microsoft.Billing/billingPeriods/{billingPeriodName}''. For e.g. to specify billing period at department scope use ''/providers/Microsoft.Billing/departments/{departmentId}/providers/Microsoft.Billing/billingPeriods/{billingPeriodName}''')]
        [Microsoft.Azure.PowerShell.Cmdlets.Billing.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.Billing.Runtime.Info(SerializedName='scope', Required, PossibleTypes=([System.String]), Description='The scope associated with usage details operations. This includes ''/subscriptions/{subscriptionId}/'' for subscription scope, ''/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}'' for resourceGroup scope, ''/providers/Microsoft.Billing/billingAccounts/{billingAccountId}'' for Billing Account scope, ''/providers/Microsoft.Billing/departments/{departmentId}'' for Department scope, ''/providers/Microsoft.Billing/enrollmentAccounts/{enrollmentAccountId}'' for EnrollmentAccount scope and ''/providers/Microsoft.Management/managementGroups/{managementGroupId}'' for Management Group scope. For subscription, billing account, department, enrollment account and management group, you can also add billing period to the scope using ''/providers/Microsoft.Billing/billingPeriods/{billingPeriodName}''. For e.g. to specify billing period at department scope use ''/providers/Microsoft.Billing/departments/{departmentId}/providers/Microsoft.Billing/billingPeriods/{billingPeriodName}''')]
        [System.String]
        # The scope associated with usage details operations. This includes '/subscriptions/{subscriptionId}/' for subscription scope, '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}' for resourceGroup scope, '/providers/Microsoft.Billing/billingAccounts/{billingAccountId}' for Billing Account scope, '/providers/Microsoft.Billing/departments/{departmentId}' for Department scope, '/providers/Microsoft.Billing/enrollmentAccounts/{enrollmentAccountId}' for EnrollmentAccount scope and '/providers/Microsoft.Management/managementGroups/{managementGroupId}' for Management Group scope. For subscription, billing account, department, enrollment account and management group, you can also add billing period to the scope using '/providers/Microsoft.Billing/billingPeriods/{billingPeriodName}'. For e.g. to specify billing period at department scope use '/providers/Microsoft.Billing/departments/{departmentId}/providers/Microsoft.Billing/billingPeriods/{billingPeriodName}'
        ${Scope},

        [Parameter(HelpMessage='The start date (in UTC) of the usage(s) to filter.')]
        [System.DateTime]
        # The start date (in UTC) of the usage(s) to filter.
        ${StartDate},

        [Parameter(HelpMessage='The end date (in UTC) of the usage(s) to filter.')]
        [System.DateTime]
        # The end date (in UTC) of the usage(s) to filter.
        ${EndDate},

        [Parameter(HelpMessage='The instance id of the usage(s) to filter.')]
        [System.String]
        # The instance id of the usage(s) to filter.
        ${InstanceId},

        [Parameter(HelpMessage='The instance name of the usage(s) to filter.')]
        [System.String]
        # The instance name of the usage(s) to filter.
        ${InstanceName},

        [Parameter(HelpMessage='The resource group of the usage(s) to filter.')]
        [System.String]
        [Alias('ResourceGroupName')]
        # The resource group of the usage(s) to filter.
        ${ResourceGroup},

        [Parameter(HelpMessage='The tag of the usage(s) to filter.')]
        [System.String]
        # The tag of the usage(s) to filter.
        ${Tag},

        [Parameter(HelpMessage='If set, signals to include meter details in the returned usage(s).')]
        [System.String]
        # If set, signals to include meter details in the returned usage(s).
        ${IncludeMeterDetails},

        [Parameter(HelpMessage='If set, signals to include additional properties in the returned usage(s).')]
        [System.String]
        # If set, signals to include additional properties in the returned usage(s).
        ${IncludeAdditionalProperties},

        [Parameter(HelpMessage='May be used to limit the number of results to the most recent N usageDetails.')]
        [Microsoft.Azure.PowerShell.Cmdlets.Billing.Category('Query')]
        [Microsoft.Azure.PowerShell.Cmdlets.Billing.Runtime.Info(SerializedName='$top', PossibleTypes=([System.Int32]), Description='May be used to limit the number of results to the most recent N usageDetails.')]
        [System.Int32]
        # May be used to limit the number of results to the most recent N usageDetails.
        ${Top},

        [Parameter(HelpMessage='The credentials, account, tenant, and subscription used for communication with Azure.')]
        [Alias('AzureRMContext', 'AzureCredential')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Billing.Category('Azure')]
        [System.Management.Automation.PSObject]
        # The credentials, account, tenant, and subscription used for communication with Azure.
        ${DefaultProfile},

        [Parameter(DontShow, HelpMessage='Wait for .NET debugger to attach')]
        [Microsoft.Azure.PowerShell.Cmdlets.Billing.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Wait for .NET debugger to attach
        ${Break},

        [Parameter(DontShow, HelpMessage='SendAsync Pipeline Steps to be appended to the front of the pipeline')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Billing.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.Billing.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be appended to the front of the pipeline
        ${HttpPipelineAppend},

        [Parameter(DontShow, HelpMessage='SendAsync Pipeline Steps to be prepended to the front of the pipeline')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Billing.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.Billing.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be prepended to the front of the pipeline
        ${HttpPipelinePrepend},

        [Parameter(DontShow, HelpMessage='The URI for the proxy server to use')]
        [Microsoft.Azure.PowerShell.Cmdlets.Billing.Category('Runtime')]
        [System.Uri]
        # The URI for the proxy server to use
        ${Proxy},

        [Parameter(DontShow, HelpMessage='Credentials for a proxy server to use for the remote call')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Billing.Category('Runtime')]
        [System.Management.Automation.PSCredential]
        # Credentials for a proxy server to use for the remote call
        ${ProxyCredential},

        [Parameter(DontShow, HelpMessage='Use the default credentials for the proxy')]
        [Microsoft.Azure.PowerShell.Cmdlets.Billing.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Use the default credentials for the proxy
        ${ProxyUseDefaultCredentials}
    )

    process {
        $DateTimeParameterFormat = "yyyy-MM-dd"
        $Filter = $null
        $Expand = $null
        if ($PSBoundParameters.ContainsKey('StartDate'))
        {
            $From = $StartDate.ToString($DateTimeParameterFormat)
            $Filter = "properties/usageStart ge '$From'"
            $null = $PSBoundParameters.Remove("StartDate")
        }

        if ($PSBoundParameters.ContainsKey('EndDate'))
        {
            $To = $EndDate.ToString($DateTimeParameterFormat)
            if ($null -ne $Filter)
            {
                $Filter += " and "
            }

            $Filter += "properties/usageEnd le '$To'"
            $null = $PSBoundParameters.Remove("EndDate")
        }

        if ($PSBoundParameters.ContainsKey('InstanceId'))
        {
            if ($null -ne $Filter)
            {
                $Filter += " and "
            }

            $Filter += "properties/instanceId eq '$InstanceId'"
            $null = $PSBoundParameters.Remove("InstanceId")
        }

        if ($PSBoundParameters.ContainsKey('InstanceName'))
        {
            if ($null -ne $Filter)
            {
                $Filter += " and "
            }

            $Filter += "properties/instanceName eq '$InstanceName'"
            $null = $PSBoundParameters.Remove("InstanceName")
        }

        if ($PSBoundParameters.ContainsKey('ResourceGroup'))
        {
            if ($null -ne $Filter)
            {
                $Filter += " and "
            }

            $Filter += "properties/resourceGroup eq '$ResourceGroup'"
            $null = $PSBoundParameters.Remove("ResourceGroup")
        }

        if ($PSBoundParameters.ContainsKey('Tag'))
        {
            if ($null -ne $Filter)
            {
                $Filter += " and "
            }

            $Filter += "properties/tags eq '$Tag'"
            $null = $PSBoundParameters.Remove("Tag")
        }

        if ($PSBoundParameters.ContainsKey('IncludeMeterDetails'))
        {
            $Expand = "properties/meterDetails"
            $null = $PSBoundParameters.Remove("IncludeMeterDetails")
        }

        if ($PSBoundParameters.ContainsKey('IncludeAdditionalProperties'))
        {
            if ($null -ne $Expand)
            {
                $Expand += " and "
            }

            $Expand += "properties/additionalProperties"
            $null = $PSBoundParameters.Remove("AdditionalProperties")
        }

        $null = $PSBoundParameters.Add("Filter", $Filter)
        $null = $PSBoundParameters.Add("Expand", $Expand)
        Az.Billing\Get-AzUsageDetail @PSBoundParameters
    }
}