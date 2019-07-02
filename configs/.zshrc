# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# Path to your oh-my-zsh installation.
export ZSH="/Users/toddwalters/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_MODE='nerdfont-fontconfig'
POWERLEVEL9K_CONTEXT_TEMPLATE='%n'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='white'
#POWERLEVEL9K_BATTERY_CHARGING='yellow'
#POWERLEVEL9K_BATTERY_CHARGED='green'
#POWERLEVEL9K_BATTERY_DISCONNECTED='$DEFAULT_COLOR'
#POWERLEVEL9K_BATTERY_LOW_THRESHOLD='10'
#POWERLEVEL9K_BATTERY_LOW_COLOR='red'
#POWERLEVEL9K_BATTERY_ICON='\uf1e6 '
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_VCS_GIT_GITHUB_ICON='\uf09b '
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{014}\u2570%F{cyan}\uF460%F{073}\uF460%F{109}\uF460%f "
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_ICON='?'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv aws time history)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv time dir_writable ip ram load background_jobs)

POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M \uf073 %d/%m/%y}"
POWERLEVEL9K_TIME_BACKGROUND='white'
POWERLEVEL9K_HISTORY_BACKGROUND='220'
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_STATUS_VERBOSE=true
POWERLEVEL9K_STATUS_CROSS=true

#POWERLEVEL9K_RAM_BACKGROUND='yellow'
#POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="white"
#POWERLEVEL9K_LOAD_WARNING_BACKGROUND="white"
#POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="white"
#POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="red"
#POWERLEVEL9K_LOAD_WARNING_FOREGROUND="yellow"
#POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="black"
#POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="red"
#POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="yellow"
#POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="green"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  aws
  brew
  colored-man-pages
  colorize
  httpie
  git
  github
  iterm2
  pip
  pyenv
  python
  pylint
  tmux
  virtualenv
  vscode
  zsh-syntax-highlighting
  zsh-completions
  zsh-autosuggestions
  )

source $ZSH/oh-my-zsh.sh

# User configuration
# Virtualenvwrapper things
export WORKON_HOME=$HOME/.virtualenvs
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
source /usr/local/bin/virtualenvwrapper.sh
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
 alias zshconfig="mate ~/.zshrc"
 alias ohmyzsh="mate ~/.oh-my-zsh"
 alias ls='/usr/local/bin/exa'
 alias lla='/usr/local/bin/exa -lagGF --group-directories-first'
 alias digs='dig +noall +answer'
 alias dock9='/usr/local/bin/docker-v1.9.0'
 alias dock10='/usr/local/bin/docker-v1.10.3'
 alias dock11='/usr/local/bin/docker-v1.11.0'
 alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES;killall Finder /System/Library/CoreServices/Finder.app'
 alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
 alias py2brewpath='export OLDPATH=$PATH; export PATH=/usr/local/Cellar/python@2/2.7.15/Frameworks/Python.framework/Versions/2.7/bin:$PATH'
 alias py3path='export PATH=$OLDPATH;unset OLDPATH'
 alias awson='. ~/.virtualenvs/aws-cli-3/bin/activate;complete -C 'aws_completer' aws'
 alias lath='/Users/rm93513/.virtualenvs/aws-cli-3/bin/lilly_aws_auth'
 alias vscode='awson;cd ~/Sandbox/config/vscode;code'
 alias fullSizeSaveOn='defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true;defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true'
 alias fullSizeSaveOff='defaults delete NSGlobalDomain NSNavPanelExpandedStateForSaveMode;defaults delete NSGlobalDomain NSNavPanelExpandedStateForSaveMode2'
 alias fullSizeSaveChk='defaults read NSGlobalDomain NSNavPanelExpandedStateForSaveMode;defaults read NSGlobalDomain NSNavPanelExpandedStateForSaveMode'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"