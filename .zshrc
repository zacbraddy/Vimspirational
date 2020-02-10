if [ "$(uname 2> /dev/null)" != "Linux" ]; then
  AM_RUNNING_IN="mac"
else
  AM_RUNNING_IN="linux"
fi

# Path to your oh-my-zsh installation.
if [[ $AM_RUNNING_IN == "mac" ]]; then 
  export ZSH="/Users/zac.braddy/.oh-my-zsh"
else
  export ZSH="$HOME/.oh-my-zsh"
fi

ZSH_THEME="pygmalion"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

if [[ $AM_RUNNING_IN == "mac" ]]; then 
  plugins=(
    git,
    brew,
    npm,
    osx,
    kubectl
  )
else
  plugins=(git npm kubectl)
fi

source $ZSH/oh-my-zsh.sh
if [[ $AM_RUNNING_IN == "mac" ]]; then 
  source /Users/zac.braddy/.zshrc.mac
else
  source $HOME/.zshrc.linux
fi

source $HOME/.zshrc.tokens

# Start zac changes
# Docker settings {{{
  # kill-all-docker-containers
  kadc() {
    docker ps -q | for i in $(cat) ; do docker stop $i; docker rm $i; done
  }
#}}}

# Yarn settings {{{
  # Setting up global yarn folder in Path
  export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# }}}

# Git settings {{{
  alias gs="git status | amazeballs"
  alias ga="git add ."
  alias gc="git commit"
  alias gp="git push"
  alias gd="git diff"
  alias gr="git reset | amazeballs"
  alias gb="grecent"
# }}}

# Tmuxinator settings {{{
  alias tmx="tmuxinator"
  kd() {
    STARTUP_DIR="$1"
    if [ -z "$STARTUP_DIR" ]; then
      STARTUP_DIR="$PWD"
    fi
    pushd "$STARTUP_DIR"
    tmuxinator start koodoo-service -n `basename $PWD`
    popd
  }
  export EDITOR="vim"
# }}}

alias gnome-terminal="gnome-terminal --fullscreen"

alias tla="GTK_THEME=Adwaita:light ~/TLA/toolbox/toolbox"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias oni2="${HOME}/Onivim2-x86_64.AppImage --force-device-scale-factor=2"
