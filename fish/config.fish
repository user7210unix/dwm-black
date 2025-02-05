set -g fish_color_normal white
set -g fish_color_command green
set -g fish_color_redirection yellow
set -g fish_color_error red
set -g fish_color_comment cyan
set -g fish_color_command_substitution magenta
set -g fish_color_operator yellow
set -g fish_color_argument blue

function fish_prompt
    set_color yellow
    echo -n ' '  # Folder icon
    set_color blue
    echo -n (prompt_pwd)  # Current directory
    echo -n ' '
    set_color green
    echo -n '# '
    set_color normal
end

alias ls='ls -a --color=auto'
alias deepseek='ollama run deepseek-r1'
alias delete='sudo nala remove "$@" && sudo nala autoremove && clear && echo "package removed"'
alias grep='grep --color=auto'
alias fetch='/home/user/Documents/tf-main/./tf.py'
alias c='clear'
alias os='/home/user/banan-os/./bos qemu'
alias install='sudo nala install -y'
alias off='poweroff'
alias update='sudo nala update && sudo nala upgrade'
alias clone 'git clone --depth 1'
alias merge 'xrdb ~/.Xresources'

set -g fish_greeting '' 
clear
