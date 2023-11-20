# Apple system related
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES;killall Finder /System/Library/CoreServices/Finder.app'
alias turnoffbt='blueutil --power 0'
alias turnoffsleep='sudo pmset -a sleep 0; sudo pmset -a hibernatemode 0; sudo pmset -a disablesleep 1'
alias turnonbt='blueutil --power 1'
alias turnonsleep='sudo pmset -a sleep 1; sudo pmset -a hibernatemode 3; sudo pmset -a disablesleep 0'

# Git

alias ga='git add'
alias gb='git branch'
alias gc='git checkout'
alias gcm='git commit -m'
alias gf='git fetch'
alias gmo='git merge origin'
alias gp='git pull'
alias gpom='git pull origin master'
alias gr='git restore'
alias gs='git status'
alias pull='git pull origin'
alias push='git push origin'
alias sapply='git stash apply'
alias stash='git stash'
# Docker
alias awl='/Applications/Microsoft\ Edge\ Dev.app/Contents/MacOS/Microsoft\ Edge\ Dev --profile-directory="Profile 1" https://waltodders.awsapps.com/start &> /dev/null &'
alias azl='/Applications/Microsoft\ Edge\ Dev.app/Contents/MacOS/Microsoft\ Edge\ Dev --profile-directory="Profile 4" &> /dev/null &; az login --use-device-code'
alias dcp='docker container prune -f'
alias di='docker images list'
alias di='docker images'
alias dp='docker pull'
alias dpa='docker ps -a'
alias drf='docker rmi -f'
alias dsp='docker system prune -f'
alias gcl='/Applications/Microsoft\ Edge\ Dev.app/Contents/MacOS/Microsoft\ Edge\ Dev --profile-directory="Profile 3" &> /dev/null &; gcloud auth login --no-launch-browser'

# Other examples
alias acss='aws-cloudformation-stack-status --color --watch'
alias awson='. ~/.virtualenvs/aws-cli-3/bin/activate'
alias cdcode='cdon;cd ~/Sandbox/config/vscode;code'
alias cdon='. ~/.virtualenvs/cloud-dev-37/bin/activate'
alias digs='dig +noall +answer'
alias lla='/opt/homebrew/bin/exa -lagGF --group-directories-first --icons'
alias ls='/opt/homebrew/bin/exa'
alias ohmyzsh="mate ~/.oh-my-zsh"
alias powershell='/usr/local/bin/pwsh'
alias shf='cat ~/.local/include/*_functions.sh | egrep function | sed 's/..$//''
alias tf='terraform'
alias venv='python3 -m venv venv && . venv/bin/activate && python3 -m pip install -U pip'

alias weather='curl wttr.in'
alias zshconfig="mate ~/.zshrc"
