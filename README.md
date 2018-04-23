# Plaster Templates

This is a collection of [Plaster](https://github.com/PowerShell/Plaster) templates I use when working in PowerShell.

Recomended Additional Modules:

* [psake](https://github.com/psake/psake)
* [PlatyPS](https://github.com/PowerShell/platyPS)
* [Pester](https://github.com/pester/Pester)
* [PSScriptAnalyzer](https://github.com/PowerShell/PSScriptAnalyzer)

## Working with Plaster

### Installation

If you have the [PowerShellGet](https://docs.microsoft.com/en-us/powershell/gallery/readme) module installed:

```
Install-Module Plaster
```

## Installation

...

## Templates

### [NewModule](docs/About_NewModule.md)

This is a modified version of the '[NewModule](https://github.com/PowerShell/Plaster/tree/master/examples/NewModule)' example template from the official [Plaster](https://github.com/PowerShell/Plaster) repository.

[More Details](NewModule/README.md)

### [NewScript](docs/About_NewScript.md)

A heavily modified version of the '[NewModule](https://github.com/PowerShell/Plaster/tree/master/examples/NewModule)' example template from the official [Plaster](https://github.com/PowerShell/Plaster) repository. This template creates a single file ps1 script with a `#PSScriptInfo` block ready for publishing.

[More Details](NewScript/README.md)