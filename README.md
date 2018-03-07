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

### Starting a project from a template (CLI)

In order to start a project using a Plaster template you need to use the `Invoke-Plaster` cmdlet and specify the location of the template and the destination for the new project. For example:

```
Invoke-Plaster -TemplatePath 'c:\pwsh\_Templates\Module' -DestinationPath 'c:\pwsh\MyNewModule'
```

After running `Invoke-Plaster` you will be prompted for information regarding the project and asked to make choices about features to include.

### Starting a project from a template (VS Code)

In VS Code with the PowerShell extension installed it is possible to run the command `PowerShell: Create New Project from Plaster Template`.

__Setup__

* Determine the Plaster installation directory

```
Get-Module Plaster -ListAvailable | select ModuleBase
```

* Place your Plaster templates in the "Templates" folder inside the Plaster installation directory.

__Running the Command__

1. In VS Code open the command palette

> Mac: <kbd>cmd+p</kbd>

> Windows / Linux: <kbd>ctrl+p</kbd>

2. Type a `>` followed by "Plaster".

3. Select the command `PowerShell: Create New Project from Plaster Template`.

4. Follow the on-screen prompts.

## Templates

### [NewModule](NewModule/)

This is a modified version of the '[NewModule](https://github.com/PowerShell/Plaster/tree/master/examples/NewModule)' example template from the official [Plaster](https://github.com/PowerShell/Plaster) repository.

[More Details](NewModule/README.md)