# PowerShell CheatSheet

## Save Cred

`$cred=Get-Credential`

## Use cred

`VSTConnVIServer -Credential $cred lab`

## Get PS Version Details

`$PSVersionTable`

## Get Local Environment Variables

`Get-ChildItem Env:`

## Set Local Environment Variable in PS Session:

`$env:TestVariable = "This is a test environment variable."`

## Delete Local Environment Variable in PS Session:

`Remove-Item Env:\MyTestVariable`

## Get Session Variables

`Get-Variable`

## Set Session Variable

`$Foo = 123`
`$Foo = "Bar"`

## Unset Variable in PS Session:

`Remove-Variable Foo`

## Load AD Management Snapin

`Add-PSSnapin Quest.ActiveRoles.ADManagement`

## List Loaded Snapins:

`Get-PSSnapin | % {$_.Name}`

## List Loaded Modules:

`Get-Module -ListAvailable`

## List Command Available Within a Module:

`Get-Command -Module <ModuleName>`

## Load AWS PowerShell Module:

`Import-Module "C:\Program Files (x86)\AWS Tools\PowerShell\AWSPowerShell\AWSPowerShell.psd1"`

## List commands available in a module

`Get-Command -Module <ModuleName>`
`Get-Command *virtualenv*`

## Grep equivalent with Select-String aka sls

`sls <file path> -pattern <text pattern to search>`
`sls c:\pub\docs\syntax -pattern foobar`
`sls c:\pub\docs\syntax -pattern Foobar -CaseSensitive`
`dir -recurse *.* | sls -pattern "foobar" | select -unique path`

## Set Environment Variable

`$env:AWS_PROFILE = "dev-lz-master"`

## List Environment Variables

`gci env:`

## You can get a list of all available modules on your computer by executing the following command:

`Get-Module -ListAvailable`

## There are few modules loaded for basic management tasks. To check which modules are loaded into PowerShell, execute the following command:

`Get-Module -All`

## You can load a particular module by executing the following command:

`Import-Module -Name AWSPowerShell`

## To list commands in a particular module, execute the following command:

`Get-Command -Module AWSPowerShell`

## Setting credential variable

`$cred=Get-Credential`
`VSTConnVIServer -Credential $cred lab`

