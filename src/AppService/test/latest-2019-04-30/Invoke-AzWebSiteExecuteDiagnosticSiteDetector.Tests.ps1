$TestRecordingFile = Join-Path $PSScriptRoot 'Invoke-AzWebSiteExecuteDiagnosticSiteDetector.Recording.json'
. (Join-Path $PSScriptRoot '..\generated\runtime' 'HttpPipelineMocking.ps1')

Describe 'Invoke-AzWebSiteExecuteDiagnosticSiteDetector' {
    It 'Execute' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'ExecuteViaIdentity' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}
