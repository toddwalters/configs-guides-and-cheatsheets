# Apple system related
alias turnonbt='blueutil --power 1'
alias turnoffbt='blueutil --power 0'
alias turnoffsleep='sudo pmset -a sleep 0; sudo pmset -a hibernatemode 0; sudo pmset -a disablesleep 1'
alias turnonsleep='sudo pmset -a sleep 1; sudo pmset -a hibernatemode 3; sudo pmset -a disablesleep 0'
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES;killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Git
alias gpom='git pull origin master'
alias gmo='git merge origin'
alias gc='git checkout'
alias gs='git status'
alias gcm='git commit -m'
alias ga='git add'
alias gb='git branch'
alias gf='git fetch'
alias gp='git pull'
alias gr='git restore'
alias push='git push origin'
alias pull='git pull origin'
alias stash='git stash'
alias sapply='git stash apply'

# Docker
alias di='docker images list'
alias dcp='docker container prune -f'
alias di='docker images'
alias dpa='docker ps -a'
alias dp='docker pull'
alias drf='docker rmi -f'
alias dsp='docker system prune -f'
alias azl='/Applications/Microsoft\ Edge\ Dev.app/Contents/MacOS/Microsoft\ Edge\ Dev --profile-directory="Profile 4" &> /dev/null &; az login --use-device-code'
alias gcl='/Applications/Microsoft\ Edge\ Dev.app/Contents/MacOS/Microsoft\ Edge\ Dev --profile-directory="Profile 3" &> /dev/null &; gcloud auth login --no-launch-browser'
alias awl='/Applications/Microsoft\ Edge\ Dev.app/Contents/MacOS/Microsoft\ Edge\ Dev --profile-directory="Profile 1" https://waltodders.awsapps.com/start &> /dev/null &'

# Other examples
alias tf='terraform'
alias kcl='kubectl'
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls='/opt/homebrew/bin/exa'
alias lla='/opt/homebrew/bin/exa -lagGF --group-directories-first --icons'
alias digs='dig +noall +answer'
alias powershell='/usr/local/bin/pwsh'
alias venv='python3 -m venv venv && . venv/bin/activate && python3 -m pip install -U pip'
alias weather='curl wttr.in'
