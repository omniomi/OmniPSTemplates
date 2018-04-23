[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [ValidateSet('Build','Test','TestSrc')]
    [string]
    $Task
)

$psakeSettingsPath = Join-Path $PSScriptRoot '_build.psake.ps1'
$PesterTestPath    = Join-Path $PSScriptRoot "..\tests"

switch ($Task) {
    'Build'   { Invoke-psake $psakeSettingsPath -taskList GenerateFileCatalog }
    'Test'    { Invoke-psake $psakeSettingsPath -taskList Test }
    'TestSrc' { Invoke-Pester $PesterTestPath }
}