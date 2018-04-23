Describe 'Plaster Template Manifest Tests' {
    $TemplatePath  = "$PSScriptRoot\..\OmniPSTemplates\Templates"
    $Templates     = Get-ChildItem $TemplatePath -Directory
    $TestTemplates = @( $Templates | % { @{ Name = $_.Name ; Path = $_.FullName } } )

    It '<Name> Passes Test-PlasterManifest' -TestCases $TestTemplates {
        param($Path)
        Test-PlasterManifest -Path (Join-Path $Path 'plasterManifest.xml')
        $? | Should Be $true
    }
}