if status is-interactive


set fish_greeting
neofetch
~/.posh/oh-my-posh init fish --config ~/.poshthemes/theme.omp.json | source
    # Commands to run in interactive sessions can go here
end
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_RUNTIME_DIR "/tmp/runtime-$UID"
set -gx XDG_DATA_DIRS "/usr/local/share:/usr/share"
set -gx XDG_CONFIG_DIRS "/etc/xdg"

alias ea='tmux kill-session'
alias e='tmux kill-session'
alias ee='exit'

function tmux-restart-all
    set current_pane (tmux display-message -p "#{pane_id}")
    for pane_id in (tmux list-panes -F "#{pane_id}")
        if test "$pane_id" != "$current_pane"
            tmux respawn-pane -k -t "$pane_id"
        end
    end
    tmux respawn-pane -k -t "$current_pane"
end
alias tra=tmux-restart-all
alias r=tmux-restart-all

alias vim=nvim