#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

. ~/z/z.sh
[[ -f ~/.zshrc_local ]] && . ~/.zshrc_local
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_AUTO_UPDATE=1

export EDITOR=$(which vim)
export VISUAL=$EDITOR
export PAGER=$(which less)

alias g=git
alias tf=terraform
alias oc=ocna-connect
alias d=docker
alias dcp=docker-compose
alias dcpr='docker-compose run'

alias ssh-with-pass='ssh -o PasswordAuthentication=yes -o PreferredAuthentications=keyboard-interactive,password -o PubkeyAuthentication=no'

function ruby-exec(){
    if [ -f .kitchen.yml ]; then
        chef exec "$@"
    elif [ -f Gemfile ]; then
        bundle check || bundle install
        bundle exec "$@"
    else
        "$@"
    fi
}

alias be='bundle exec'
alias ruby='ruby-exec ruby'
alias irb='ruby-exec irb'
alias rspec='ruby-exec rspec'
alias rake='ruby-exec rake'

command -v rbenv >/dev/null 2>&1 && eval "$(rbenv init - zsh)"
command -v pyenv >/dev/null 2>&1 && eval "$(pyenv init -)"

#include jq
function jqi(){
    q="$1"
    shift
    for i in $@
    do
        jq $q $i | sponge $i
    done
}
