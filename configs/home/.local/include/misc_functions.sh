# Hex Color Print Function
function hexcb() { 
  for i in {0..255} ; do
      printf "\x1b[48;5;%sm%3d\e[0m " "$i" "$i"
      if (( i == 15 )) || (( i > 15 )) && (( (i-15) % 6 == 0 )); then
          printf "\n";
      fi
  done
}

function vscode() { 
   . ~/.venv/cloud-dev/bin/activate;cd ~/configs/vscode/;/Applications/Visual\ Studio\ Code\ -\ Insiders.app/Contents/MacOS/Electron $1 &> /dev/null &
}
