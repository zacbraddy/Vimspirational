# Path to your oh-my-zsh installation.
export ZSH="/Users/zac.braddy/.oh-my-zsh"

ZSH_THEME="pygmalion"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

plugins=(
  git,
  brew,
  npm,
  osx
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
  # Alias so I only have to type k for the kubectl command
  alias k="kubectl "

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

# Git settings {{{
  alias amazeballs="cowsay -n -r | lolcat"
  alias gs="git status | amazeballs"
  alias ga="git add ."
  alias gc="git commit"
  alias gp="git push | amazeballs"
  alias gd="git diff"
  alias gr="git reset"
# }}}
