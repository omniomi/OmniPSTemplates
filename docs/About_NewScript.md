# NewScript

This is a plaster template for publishable scripts (includes `<#PSScriptInfo...#>`.) It is modified from the '[NewModule](https://github.com/PowerShell/Plaster/tree/master/examples/NewModule)' example in the official [Plaster](https://github.com/PowerShell/Plaster) repository.

## Structure

### Folder Structure

Unlike a module publishable scripts must be a single ps1 file. As a result the folder structure is simplified from the module template:

```
ScriptName\
|- src\
    |- ScriptName.ps1
```

The structure will contain additional folders for tests, vscode settings, etc based on setup choices.

### Script Structure

The ps1 file will be scaffolded with a `#PSScriptInfo` block and a number of sections delimited by comments:

```
#PSScriptInfo block
cmdletbinding & parameter block

Static user-set variables

Static variables

Helper functions

Script logic
```

## Features

### Base script file

#### `$StopWatch`

The base script contains a `[hashtable]` variable called `$StopWatch` which is used to track elapsed time of various steps in the script. By default it tracks the loading of all of the functions to memory, the main logic section, and the total run time. The elapsed time of each step is written to the verbose stream at the completion of the script.

__Example__
```
VERBOSE: Step            ElapsedTime
VERBOSE: ----            -----------
VERBOSE: LoadFunctions   00:00:00.0006366
VERBOSE: ScriptLogic     00:00:00.0006486
VERBOSE:
VERBOSE: Total 00:00:00.0108750
```

__Add Step Timer__

To add your own step timer all you need to do is add a key to the `$StopWatch` table containing a stopwatch object, write some logic, and then stop the timer:

```
$StopWatch.MyStep = [System.Diagnostics.Stopwatch]::StartNew()

# MyStep logic here...

$StopWatch.MyStep.Stop()
```

It will be automatically included in the table output to the verbose stream at the end.

### Project level

- Pester tests, PSScriptAnalyzer settings, and psake build scripts included.
- VS Code settings and tasks included.
