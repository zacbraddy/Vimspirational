# Path to your oh-my-zsh installation.
export ZSH="/Users/zac.braddy/.oh-my-zsh"

ZSH_THEME="pygmalion"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

plugins=(
  git,
  brew,
  npm,
  osx,
  kubectl
)

source $ZSH/oh-my-zsh.sh

# Start zac changes
# Mac Settings {{{
  # Some stuff to make the delete key on keyboards that have them act a little more sane on mac
  ZSH_DISABLE_COMPFIX=true
  bindkey "^D" delete-char-or-list
  bindkey "^H" backward-delete-char
  bindkey "^[3;5~" delete-char
  bindkey "^[[3~" delete-char
  bindkey "^?" backward-delete-char
# }}}

# Kubernetes settings {{{
  # Alias so I only have to type k for the kubectl command and shorten other kubernetes tool commands
  alias k="kubectl "
  alias kb="kubens "
  alias kc="kubectx "

  kb dev-quoll

  # Set the kubectl standard editor
  export KUBE_EDITOR="vim"

  # The next line updates PATH for the Google Cloud SDK.
  if [ -f '/Users/zac.braddy/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/zac.braddy/google-cloud-sdk/path.zsh.inc'; fi

  # The next line enables shell command completion for gcloud.
  if [ -f '/Users/zac.braddy/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/zac.braddy/google-cloud-sdk/completion.zsh.inc'; fi
# }}}

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

# Node settings {{{
  # Setting up global yarn folder in Path
  export PATH="/usr/local/opt/node@8/bin:$PATH"
# }}}

# Git settings {{{
  alias amazeballs="cowsay -n | lolcat"
  alias gs="git status | amazeballs"
  alias ga="git add ."
  alias gc="git commit"
  alias gp="git push"
  alias gd="git diff"
  alias gr="git reset | amazeballs"
  alias gb="grecent"
# }}}

# Add flutter to path (although this assumes that flutter is install in my projects folder which it isn't anymore so might need changing
export PATH="/Users/zac.braddy/Projects/flutter/bin:$PATH"

# Don't use the native ruby that comes with osx like a chump use the one you installed with brew
export PATH="/usr/local/opt/ruby/bin:$PATH"

# Make it so that ruby gems get installed and used from within my home directory instead of where every else that crazy thing stores them
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH
export PATH="/usr/local/opt/node@10/bin:$PATH"
