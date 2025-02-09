if status is-interactive
end

starship init fish | source

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fzf --fish | source

# pnpm
set -gx PNPM_HOME "/home/nicolas/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
#

alias ls="exa --icons"
alias ll="exa -lah --icons"
alias config='/usr/bin/git --git-dir=/home/nicolas/.cfg/ --work-tree=/home/nicolas'
