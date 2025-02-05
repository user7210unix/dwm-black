# Begin ~/.config/fish/config.fish

# Set up prompt
set -g fish_color_normal white
set -g fish_color_command green
set -g fish_color_redirection yellow
set -g fish_color_error red
set -g fish_color_comment cyan
set -g fish_color_command_substitution magenta
set -g fish_color_operator yellow
set -g fish_color_argument blue

# Set custom prompt format (similar to PS1 in bash)
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


# Aliases (similar to bash aliases)
alias ls='ls -a --color=auto'
alias deepseek='ollama run deepseek-r1'
alias delete='sudo nala remove "$@" && sudo nala autoremove && clear && echo "package removed"'
alias grep='grep --color=auto'
alias fetch='/home/user/Documents/tf-main/./tf.py'
alias c='clear'
alias os='/home/user/banan-os/./bos qemu'
alias install='sudo nala install -y'
alias top='btm --theme nord'
alias off='poweroff'
alias update='sudo nala update && sudo nala upgrade'
alias l='ls -la'
alias clone 'git clone --depth 1'
alias merge 'xrdb ~/.Xresources'

# Fish plugins installation via Oh My Fish
# Install useful plugins
set -g fish_greeting '' 
clear
# End ~/.config/fish/config.fish
