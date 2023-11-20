$env:PATH = "/Users/toddwalters/.pyenv/shims:/Users/toddwalters/.nvm/versions/node/v14.2.0/bin:/opt/homebrew/bin:/usr/local/bin:/Users/toddwalters/.dotnet/tools:/usr/local/microsoft/powershell/7:/usr/bin:/bin:/usr/sbin:/sbin"

Import-Module posh-git
Import-Module Microsoft.PowerShell.UnixCompleters
Import-Module PSReadLine

Add-Content -Path $PROFILE.CurrentUserAllHosts -Value '$(/opt/homebrew/bin/brew shellenv) | Invoke-Expression'

$env:POSH_GIT_ENABLED = "True"

# Set-Alias ls "/opt/homebrew/bin/exa --color never"
function ls {
    /opt/homebrew/bin/exa --color never -la
}

function lla {
/opt/homebrew/bin/exa -lagGF --group-directories-first
}

function digs {
dig +noall +answer
}
function weather {
curl wttr.in
}

Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineOption -HistorySearchCursorMovesToEnd:$true

# EditorServicesCommandSuite - Only needs to load in Vscode.
if ($host.name -eq 'Visual Studio Code Host') {
Import-Module EditorServicesCommandSuite
Import-EditorCommand -Module EditorServicesCommandSuite
}

oh-my-posh init pwsh --config '/opt/homebrew/Cellar/oh-my-posh/17.05.2/themes/powerlevel10k_rainbow.omp.json' | Invoke-Expression
