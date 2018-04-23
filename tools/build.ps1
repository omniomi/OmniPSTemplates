[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [ValidateSet('Build','Test')]
    [string]
    $Task
)