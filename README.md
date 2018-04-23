# Plaster Templates

This is a collection of [Plaster](https://github.com/PowerShell/Plaster) templates I use when working in PowerShell.

Recomended Additional Modules:

* [psake](https://github.com/psake/psake)
* [PlatyPS](https://github.com/PowerShell/platyPS)
* [Pester](https://github.com/pester/Pester)
* [PSScriptAnalyzer](https://github.com/PowerShell/PSScriptAnalyzer)

## Working with Plaster

### Install Plaster

If you have the [PowerShellGet](https://docs.microsoft.com/en-us/powershell/gallery/readme) module installed:

```
Install-Module Plaster
```

## Installation

### PowerShell Gallery

```
Install-Module SSPowerShellBoilerplate -Scope CurrentUser
```

### Manually

#### From Source

```
git clone https://github.com/omniomi/Plaster-Templates.git
cd .\Plaster-Templates\tools
.\Build.ps1 Install
```

#### From Zip

1. Download the OmniPSTemplates.zip from ...
2. Extract the contents to `C:\Users\<Your Name>\Documents\WindowsPowerShell\Modules\`

## Usage

### Command Line

**Module**

```
$Template =  Get-PlasterTemplate -IncludeInstalledModules | ? { $_.Title -eq "Omni's New Module" }
Invoke-Plaster -TemplatePath $Template.TemplatePath
```

**Script**

```
$Template =  Get-PlasterTemplate -IncludeInstalledModules | ? { $_.Title -eq "Omni's New Script" }
Invoke-Plaster -TemplatePath $Template.TemplatePath
```

### VS Code

1. In VS Code open the command palette

> Mac: <kbd>cmd+p</kbd>

> Windows / Linux: <kbd>ctrl+p</kbd>

2. Type a ">" followed by "Plaster".

3. Select the command "PowerShell: Create New Project from Plaster Template."

4. Click the option to "Load additional templates from installed modules" at the top.

5. Select the appropriate template.


## Templates

### [NewModule](docs/About_NewModule.md)

This is a modified version of the '[NewModule](https://github.com/PowerShell/Plaster/tree/master/examples/NewModule)' example template from the official [Plaster](https://github.com/PowerShell/Plaster) repository.

### [NewScript](docs/About_NewScript.md)

A heavily modified version of the '[NewModule](https://github.com/PowerShell/Plaster/tree/master/examples/NewModule)' example template from the official [Plaster](https://github.com/PowerShell/Plaster) repository. This template creates a single file ps1 script with a `#PSScriptInfo` block ready for publishing.