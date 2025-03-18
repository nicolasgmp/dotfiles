# theme
# set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "exa -G --icons"
alias la "exa -a --icons"
alias ll "exa -l --icons"
alias lla "ll -A --icons"
alias g git
alias c claude
command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fzf --fish | source

# pnpm
set -gx PNPM_HOME "/home/nicolas/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

alias config='/usr/bin/git --git-dir=/home/nicolas/.cfg/ --work-tree=/home/nicolas'

function cpprun
    set build_dir build
    mkdir -p $build_dir
    set filename (basename $argv)
    set output (basename $argv .cpp)
    g++ -O2 -Wall $filename -o $build_dir/$output && ./$build_dir/$output
end

set -gx TERM xterm-256color

set -g pure_symbol_prompt "-> "
