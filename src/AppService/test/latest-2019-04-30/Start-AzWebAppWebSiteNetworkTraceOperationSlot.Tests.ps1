$TestRecordingFile = Join-Path $PSScriptRoot 'Start-AzWebAppWebSiteNetworkTraceOperationSlot.Recording.json'
. (Join-Path $PSScriptRoot '..\generated\runtime' 'HttpPipelineMocking.ps1')

Describe 'Start-AzWebAppWebSiteNetworkTraceOperationSlot' {
    It 'Start' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'StartViaIdentity' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}
