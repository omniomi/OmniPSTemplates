[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [ValidateSet('Build','Test','TestSrc','Install')]
    [string]
    $Task
)

$psakeSettingsPath = Join-Path $PSScriptRoot '_build.psake.ps1'
$PesterTestPath    = Join-Path $PSScriptRoot "..\tests"
$ReleasePath       = Join-Path $PSScriptRoot "..\Release"
$ModuleInstallPath = Join-Path $env:USERPROFILE "\Documents\WindowsPowerShell\Modules"

switch ($Task) {
    'Build'   { Invoke-psake $psakeSettingsPath -taskList GenerateFileCatalog }
    'Test'    { Invoke-psake $psakeSettingsPath -taskList Test }
    'TestSrc' { Invoke-Pester $PesterTestPath }
    'Install' {
        if (Test-Path (Join-Path $ModuleInstallPath 'OmniPSTemplates')) { throw "It appears this module is already installed. Please delete it from $ModuleInstallPath" }

        Write-Host "#`n# Starting Build...`n#"
        Invoke-psake $psakeSettingsPath -taskList GenerateFileCatalog
        Write-Host "`n`n`# Install Module..."
        Get-ChildItem -LiteralPath $ReleasePath -Directory | Copy-Item -Destination $ModuleInstallPath -Recurse
        Write-Host "# Finished."
    }
}