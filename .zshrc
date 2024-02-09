export NVM_DIR=~/.nvm

export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:/Users/hbzengin/dev/tooling/flutter/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
source $(brew --prefix nvm)/nvm.sh
export EDITOR="code -w"

export GPG_TTY=$(tty)

export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

e ()
{
    emacs "$@" &
}

eba ()
{
    source env/bin/activate
}

d ()
{
    deactivate
}

caen ()
{
  ssh hbzengin@login.engin.umich.edu
}

201 ()
{
  ssh hbzengin@peritia.eecs.umich.edu
}

sync2caen () {
  rsync -rtv "$1" hbzengin@login.engin.umich.edu:~/"$2"
}

441 () {
    ssh -i eecs441.pem ubuntu@34.172.120.53   
}

# Alias for nvim
alias vim="nvim"

# Colored ls command
alias ls='ls -G'

# Alias for locate (Linux version) on MacOS
alias locate='mdfind -name'

# Shell function for find
find ()
{
    /usr/bin/find . -iname "*$1*"
}


alias n='open -a iTerm .'

setopt prompt_subst
autoload -Uz vcs_info

zstyle ':vcs_info:*' actionformats '%b'
zstyle ':vcs_info:*' formats '%b'
zstyle ':vcs_info:*' enable git

 
precmd() {
  exit_code=$?
  vcs_info
  
  git_branch=""
  if [ -n "$vcs_info_msg_0_" ]; then
      git_branch="%F{blue}git:(%F{red}${vcs_info_msg_0_}%F{blue})%f "
  fi

  declare -A signal_map
  signal_map=( [1]="SIGHUP" [2]="SIGINT" [3]="SIGQUIT" [15]="SIGTERM" ) 

  if [ $exit_code -eq 0 ]; then
    RPROMPT=""
  elif [ $exit_code -ge 128 ]; then

    signal_number=$(( $exit_code - 128 ))
    
    RPROMPT="%F{red}✗${signal_map[$signal_number]-$exit_code}%f"
  else
    RPROMPT="%F{red}✗$exit_code%f"
  fi
}

 # PROMPT='%F{magenta}${git_branch}%B%f%F{green}%n@%m %F{white}%1~ %f%b%F{white}%B$%b%f '
 PROMPT='%B%F{green}[~] %F{cyan}%1~ ${git_branch}%f%b'
 # ➜ 

 # enable core dumps on current shell
 ulimit -c unlimited 
