# @Author  : Jintao Guo
# @Email   : guojt-4451@163.com
# @Date    : 2017-10-19 14:33:15

# Path to your oh-my-zsh installation.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="best"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
plugins=(autojump)

# User configuration

##### standard aliases (start with a space to be ignored in history)
## ignore space command
export HISTCONTROL=ignorespace
export HISTCONTROL=ignoredups
export HISTCONTROL=erasedups

##### specific aliases
# ls
# F : append indicator (one of */=>@|) to entries
# 1 : list one file per line
# S : sort by file size
alias ls=' ls -C -F -h --color=auto'
alias l=' ls -1'
alias la=' ls -lA'
alias ll=' ls -l'
alias lss=' ls -lS'     # sort by file size
alias lt=' ls -lt'      # sort by modification time, newest first
alias ltr=' ls -ltr'    # sort by modification time, oldest first
alias lv=' ls -lv'      # sort by numbers within text
alias lx=' ls -lXB'      # sort by extension
# cd
alias cd=' cd'
alias ..=' cd ..; ls'
alias ...=' cd ..; cd ..; ls'
alias ....=' cd ..; cd ..; cd ..; ls'
alias cd..='..'
alias cd...='...'
alias cd....='....'
# grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
# screen
alias sss='screen -S'
alias sl='screen -ls'
alias sr='screen -r'
alias sd='screen -dr'
# tmux
alias tl='tmux ls'
alias tt='tmux attach-session -t'
alias tn='tmux new-session -s'
alias tk='tmux kill-session -t'
# du
alias df=' df -h'
alias dh=' du -h'
alias da=' du -sh'
alias d1=' du -h --max-depth=1'
# ssh
alias mhpc='sshfs -o follow_symlinks -o uid=1000 -o gid=1000 -o umask=022 $username@$IP:~ ~/hpc '
alias mgate='sshfs -o transform_symlinks -o reconnect -o follow_symlinks -o uid=1000 -o gid=1000 -o umask=022 $username@$IP:~ ~/gate'
# other
alias less='less -S'
alias scpr='rsync -vPe ssh'
alias pwd=' pwd -P'

#
alias http='python -m SimpleHTTPServer 8989'
alias jupyter='jupyter notebook'
alias httpy='python -m SimpleHTTPServer'

alias p=' ps aux | grep'
alias d=' dirs -v'
alias k9='kill -9'

# cluster qstat
alias q='showq'
alias qa='qstat -a'
alias qn='qstat -n'
alias qq='qstat -q'
alias qf='qstat -f'

# Git
alias ga="git add"
alias gm="git commit -m"
alias gc= "git checkout"
alias gs="git status"
alias gp='git push'
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit "
alias gb='git branch'
alias gd='git diff' #显示缓存变化
alias ghard='git reset --hard'

# check the XX levels size of a directory below the command line argument
function dm {
    if [ -z $1]; then
        $1=1
    fi
    du -h --max-depth=$1
}

# print XXX column
function col {
    echo $1,$2
    ll $1 | awk '{print $"'$2'"}'
}

# print the column number of a file
function ncol {
    if [[ -f $1 ]]; then
        awk '{print NF}' $1 |less
    else
        awk -F "$1" '{print NF}' $2 |less
    fi
}

# mutilple lines to one line
function line {
    if [[ -f $1 ]]; then
        paste -s $1
    else
        paste -s -d $1 $2
    fi
}

# print file like a table
function table {
    if [[ -f $1 ]]; then
        column -t $1|less -N
    else
        column -t -s $1 $2|less -N
    fi
}

# what I want to learn
function h {
printf '%-3s : %s\n' "lx" "sort by extension"
printf '%-3s : %s\n' "lss" "sort by size"
printf '%-3s : %s\n' "lt" "sort by modification time, newest first"
printf '%-3s : %s\n' "ltr" "sort by modification time, oldest first"
printf '%-3s : %s\n' "lv" "sort by numbers within text"
}

# PATH
export PATH=$PATH

# export MANPATH="/usr/local/man:$MANPATH"
export RSTUDIO_WHICH_R="/opt/R-3.4.0/bin/R"
source $ZSH/oh-my-zsh.sh









