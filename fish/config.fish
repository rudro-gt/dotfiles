# Fish shell configuration
# Equivalent to .zshrc

# PATH configuration
set -gx PATH /usr/local/bin $HOME/.local/bin $HOME/go/bin /usr/local/go/bin $HOME/.cargo/bin $PATH
set -gx PATH $HOME/.bun/bin $PATH
set -gx PATH $HOME/.local/share/pnpm $PATH

# Editor configuration
set -gx EDITOR '/usr/sbin/nvim'
set -gx VISUAL '/usr/sbin/nvim'

# Oh-my-zsh equivalent update days (not directly applicable to Fish, but kept for reference)
# set -gx UPDATE_ZSH_DAYS 30

# Bun
set -gx BUN_INSTALL "$HOME/.bun"

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"

# Initialize starship prompt
starship init fish | source

# Initialize zoxide
zoxide init fish | source

# Aliases
alias zshconfig="nvim ~/.zshrc"
alias fishconfig="nvim ~/.config/fish/config.fish"
alias vim="nvim"
alias cal="cal --sunday"
alias cls="clear"
alias cin="xclip -selection clipboard -in"
alias cout="xclip -selection clipboard -out"
alias hs='history | sed "s/^[0-9][0-9]* //g" | fzf | cin'
alias gg="lazygit"
alias ls="eza -w 100 --color=always --icons=always --sort=extension --group-directories-first"
alias l="ls --long --all"
alias zl="zellij"

# Key bindings
# Fish uses different keybinding syntax
# Vim-like navigation
bind \cp up-or-search
bind \cn down-or-search
bind \cw forward-word
bind \ce forward-word  # Fish doesn't have exact equivalent to vi-forward-word-end
bind \cb backward-word
bind \e\[Z backward-kill-word  # Shift+Tab

# Custom Tab and backtick bindings
bind \t accept-autosuggestion  # Tab accepts the grayed-out autosuggestion
bind ` complete  # Backtick triggers completion menu (like default Tab behavior)

# Custom function to list contents on directory change
function custom_chpwd --on-variable PWD
    ls
end

# Zellij auto-start check and initial ls
if not set -q ZELLIJ
    zl ls
else
    ls
end

# Bun completions (if bun generates Fish completions)
if test -f $HOME/.bun/_bun.fish
    source $HOME/.bun/_bun.fish
end