$TestRecordingFile = Join-Path $PSScriptRoot 'Get-AzAppServiceEnvironmentAppServicePlan.Recording.json'
. (Join-Path $PSScriptRoot '..\generated\runtime' 'HttpPipelineMocking.ps1')

Describe 'Get-AzAppServiceEnvironmentAppServicePlan' {
    It 'List' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}
