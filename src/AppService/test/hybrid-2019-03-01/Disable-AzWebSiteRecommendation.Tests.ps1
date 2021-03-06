$TestRecordingFile = Join-Path $PSScriptRoot 'Disable-AzWebSiteRecommendation.Recording.json'
. (Join-Path $PSScriptRoot '..\generated\runtime' 'HttpPipelineMocking.ps1')

Describe 'Disable-AzWebSiteRecommendation' {
    It 'Disable' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'Disable4' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'Disable3' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'DisableViaIdentity4' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'DisableViaIdentity3' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'DisableViaIdentity' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}
