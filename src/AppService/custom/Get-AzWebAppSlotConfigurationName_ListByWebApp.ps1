function Get-AzWebAppSlotConfigurationName_ListByWebApp {
    [OutputType('Microsoft.Azure.PowerShell.Cmdlets.AppService.Models.Api20180201.ISlotConfigNamesResource')]
    [CmdletBinding(PositionalBinding=$false)]
    [Microsoft.Azure.PowerShell.Cmdlets.AppService.Profile('latest-2019-04-30')]
    param(
        [Parameter(Mandatory, HelpMessage='Your Azure subscription ID. This is a GUID-formatted string (e.g. 00000000-0000-0000-0000-000000000000).')]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Runtime.DefaultInfo(Script='(Get-AzContext).Subscription.Id')]
        [System.String[]]
        ${SubscriptionId},

        [Parameter(Mandatory, HelpMessage='The object representation of the web app or slot.')]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Models.Api20180201.ISite]
        ${WebApp},

        [Parameter(HelpMessage='The credentials, account, tenant, and subscription used for communication with Azure.')]
        [Alias('AzureRMContext', 'AzureCredential')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Category('Azure')]
        [System.Management.Automation.PSObject]
        ${DefaultProfile},

        [Parameter(DontShow, HelpMessage='Wait for .NET debugger to attach')]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        ${Break},

        [Parameter(DontShow, HelpMessage='SendAsync Pipeline Steps to be appended to the front of the pipeline')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Runtime.SendAsyncStep[]]
        ${HttpPipelineAppend},

        [Parameter(DontShow, HelpMessage='SendAsync Pipeline Steps to be prepended to the front of the pipeline')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Runtime.SendAsyncStep[]]
        ${HttpPipelinePrepend},

        [Parameter(DontShow, HelpMessage='The URI for the proxy server to use')]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Category('Runtime')]
        [System.Uri]
        ${Proxy},

        [Parameter(DontShow, HelpMessage='Credentials for a proxy server to use for the remote call')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Category('Runtime')]
        [System.Management.Automation.PSCredential]
        ${ProxyCredential},

        [Parameter(DontShow, HelpMessage='Use the default credentials for the proxy')]
        [Microsoft.Azure.PowerShell.Cmdlets.AppService.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        ${ProxyUseDefaultCredentials}
    )

    process {
        $Tokens = $WebApp.Id.Split("/", [System.StringSplitOptions]::RemoveEmptyEntries)
        $null = $PSBoundParameters.Add("ResourceGroupName", $Tokens[3])
        $null = $PSBoundParameters.Add("Name", $Tokens[7])
        $null = $PSBoundParameters.Remove("WebApp")
        Az.WebSite\Get-AzWebAppSlotConfigurationName @PSBoundParameters
    }
}