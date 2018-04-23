[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [ValidateSet('Build','Test','Finish')]
    [string]
    $Task
)