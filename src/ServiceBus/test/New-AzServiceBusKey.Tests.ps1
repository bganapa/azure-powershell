. (Join-Path $PSScriptRoot '..\generated\runtime' 'HttpPipelineMocking.ps1')

Describe 'New-AzServiceBusKey' {
    It 'Namespace' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'Queue' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'Topic' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}
