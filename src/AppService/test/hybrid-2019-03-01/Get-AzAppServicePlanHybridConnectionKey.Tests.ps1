$TestRecordingFile = Join-Path $PSScriptRoot 'Get-AzAppServicePlanHybridConnectionKey.Recording.json'
. (Join-Path $PSScriptRoot '..\generated\runtime' 'HttpPipelineMocking.ps1')

Describe 'Get-AzAppServicePlanHybridConnectionKey' {
    It 'List' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}
