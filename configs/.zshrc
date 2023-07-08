if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory
export GREP_OPTIONS='--color=auto'
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
for file in $HOME/.local/include/*;
  do source $file
done

# AWS Profile Functions
function aws-profiles() { grep -E "^\[.*\]" ~/.aws/config |grep -v sso-session | sed -E "s/^\[(.*)\]/\1/"; }

function asp() {
  export AWS_PROFILE=$1
}

# Hex Color Print Function
function hexcb() { 
  for i in {0..255} ; do
      printf "\x1b[48;5;%sm%3d\e[0m " "$i" "$i"
      if (( i == 15 )) || (( i > 15 )) && (( (i-15) % 6 == 0 )); then
          printf "\n";
      fi
  done
}

eval "$(pyenv init -)"
eval "$(mcfly init zsh)"
eval "$(starship init zsh)"
