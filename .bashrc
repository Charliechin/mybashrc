# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
  *)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export FART='heh'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias v='vim'
# Rails Aliases
alias migrate='rake db:migrate'
alias rs='rails s'
alias rc='rails c'
#alias rspecc='rspec spec/$1'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/Rubyme/RubyMine-2018.1/bin"
export COMMAND_NOT_FOUND_INSTALL_PROMPT=1
source $HOME/.rvm/scripts/rvm
# Fix color issues with tmux
alias tmux="TERM=screen-256color-bce tmux"
# cs command, cd and ls afterwards
function cs {
  builtin cd "$@" && ls -F
}
function weather {
  curl -s wttr.in/$1
}




BLACK="\[\033[0;30m\]"
BLUE="\[\033[0;34m\]"
GREEN="\[\033[0;32m\]"
CYAN="\[\033[0;36m\]"
RED="\[\033[0;31m\]"
PURPLE="\[\033[0;35m\]"
BROWN="\[\033[0;33m\]"
LGRAY="\[\033[0;37m\]"
DGRAY="\[\033[1;30m\]"
LBLUE="\[\033[1;34m\]"
LGREEN="\[\033[1;32m\]"
LCYAN="\[\033[1;36m\]"
LRED="\[\033[1;31m\]"
LPURPLE="\[\033[1;35m\]"
YELLOW="\[\033[1;33m\]"
WHITE="\[\033[1;37m\]"
NOCOLOR="\[\033[0m\]"

#function cool_prompt {
#  PS1="$BLUE[\t] \u@$(if [[ -x /usr/local/bin/my-instance-name  ]]; then echo "$RED$(/usr/local/bin/my-instance-name)$BLUE"; elif [[ -f ~/.homed  ]]; then echo "$RED$(hostname -s)$BLUE"; else hostname -s; fi) "
#  [[ $(type -t __git_ps1) = "function"  ]] && PS1="${PS1}$(__git_ps1 '%s:')"
#  PS1="${PS1}\W \!$ $YELLOW"
#
#}
#
#PROMPT_COMMAND=cool_prompt
#






#=== This is a series of tips that I find helpful ===
export EDITOR=vim

#bind "set completion-ignore-case on"
shopt -s cdspell
shopt -s checkwinsize

if [ -x /usr/bin/dircolors  ]; then
  test -r $HOME/.dircolors && eval "$(dircolors -b $HOME/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi
# To identify a picture:
#   identify <IMAGE.jpg>

# To crop a image
#
# Find text within a folder
# grep -r "asdf" "/tmp/testdir/"

# Browsersync rails project
# browser-sync start --proxy localhost:3000 --files "app/assets/stylesheets/**/*.scss, app/views/**/*.html.erb"
# To connect to heroku
# heroku run console --app appName
# Show Desktop -> ctrl + Win + d
# to press icon in desktop and minimize
# $ gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
# To flip the screen and trackpad use
# get it from https://gist.github.com/mildmojo/48e9025070a2ba40795c
# $ rotate_desktop [normal|left|right]

[ -f /etc/bash_completion  ] && . /etc/bash_completion
 alias enter_matrix='echo -e "\e[32m"; while :; do for i in {1..16}; do r="$(($RANDOM % 2))"; if [[ $(($RANDOM % 5)) == 1  ]]; then if [[ $(($RANDOM % 4)) == 1  ]]; then v+="\e[1m $r   "; else v+="\e[2m $r   "; fi; else v+="     "; fi; done; echo -e "$v"; v=""; done'
 alias fortunis='fortune -a | cowsay | lolcat -p 6'
 # for azilo, copies my working version of the db config
 alias azilodb='cp ~/Sites/database.yml ~/Sites/azilodevelopment/config'
 # checkout the db config, run it on /azilodevelopment only
 alias undbthis='git checkout config/database.yml && printf "Checked out config/database.yml \n\n"'
 fortunis
 alias cda='cd ~/Sites/azilodevelopment'

 # Delete this if you don't remember what is it anymore
 export TWILIO_ACCOUNT_SID=AC17f633924f819879c5f1f83877f3ef85 
 export TWILIO_AUTH_TOKEN=2934e990f32c5271363bf8fc90bad52d
 export TWILIO_NUMBER=+447549273987

# function for the ropita app
# def fancy_array_permutation array
#  return array[0] if array.size == 1
#  first = array.shift
#  return first.product( fancy_array_permutation(array) ).map {|x| x.flatten.join(" ")}
#end

# Play tiny game like Typeracer (To practice or warmup  typing)
# gem install 'need_for_type'
# anytime in the terminal type 'need_for_type'

# Run Chrome in App Mode (hides address bars / tabs)
# google-chrome --app=https://google.com 


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/carlos/Downloads/google-cloud-sdk-232.0.0-linux-x86_64/google-cloud-sdk/path.bash.inc' ]; then . '/home/carlos/Downloads/google-cloud-sdk-232.0.0-linux-x86_64/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/carlos/Downloads/google-cloud-sdk-232.0.0-linux-x86_64/google-cloud-sdk/completion.bash.inc' ]; then . '/home/carlos/Downloads/google-cloud-sdk-232.0.0-linux-x86_64/google-cloud-sdk/completion.bash.inc'; fi
