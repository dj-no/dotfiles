# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/valig/.zshrc'

# prompt
#autoload -Uz vcs_info # enable vcs_info
#precmd () { vcs_info } # always load before displaying the prompt
#zstyle ':vcs_info:*' formats ' %s(%F{red}%b%f)' # git(main)
#PS1='%n@%m %F{red}%/%f$vcs_info_msg_0_ $ ' # david@macbook /tmp/repo (main) $

# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '('$branch') '
  fi
}

# Enable substitution in the prompt.
setopt prompt_subst

# Config for prompt. PS1 synonym.
#prompt='%n@%m %~/ $(git_branch_name) > '
autoload -U colors && colors
#PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "
PROMPT='%F{red}%n%F{white}@%F{blue}%m %F{yellow}%~ %F{green}$(git_branch_name)%B%(?.%F{green}.%F{red})[%?]%f%b %F{141}> %F{reset}'
#_update_ps1() {
#    PS1="$(powerline $?)"
#}
#precmd_functions+=(_update_ps1)

# aliases
alias -g md=mkdir
alias -g mi=micro
alias -g m=mpv
alias -g yt=youtube-dl
alias -g yta='youtube-dl -x'
alias -g ytc='youtube-dl -f 18'
alias -g g=git
alias -g in='yay -S'
alias -g c=curl
alias -g up='yay -Syu --noconfirm'
alias -g ffm=ffmpeg
alias -g nv=nvim
alias -g sudo=doas
alias -g dl='curl $1 -O'
alias -g fart='echo "Kys gaming time"'
alias -g ls="ls --color=always"
alias -g la="ls -a --color=always"
export PATH=/home/valig/customprogs:$PATH

# qt5ct cuz brok
unset QT_STYLE_OVERRIDE
export QT_QPA_PLATFORMTHEME=qt5ct

autoload -Uz compinit
compinit
# End of lines added by compinstall

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="/home/valig/.sdkman"
#[[ -s "/home/valig/.sdkman/bin/sdkman-init.sh" ]] && source "/home/valig/.sdkman/bin/sdkman-init.sh"

source ~/.config/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh   
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

