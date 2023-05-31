# Check if the session is initiated via SSH
if [[ -n $SSH_CLIENT ]] || [[ -n $SSH_TTY ]]; then
#echo ssh
    termux-wake-lock &
    if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
        tmux new && exit
    fi
fi
#fish && exit
tmux_restart_all_func() {
    current_pane=$(tmux display-message -p "#{pane_id}")
    for pane_id in $(tmux list-panes -F "#{pane_id}"); do
        if [ "$pane_id" != "$current_pane" ]; then
            tmux respawn-pane -k -t "$pane_id"
        fi
    done
    tmux respawn-pane -k -t "$current_pane"
}

alias tmux-restart-all=tmux_restart_all_func
if ! [[ -n $SSH_CLIENT ]] || ! [[ -n $SSH_TTY ]]; then
#echo ssh
    if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then

        #tmux new-session -d \; split-window -h -c '#{pane_current_path}' \; select-pane -L \; new-window -c '#{pane_current_path}' \; split-window -h -c '#{pane_current_path}' \; select-pane -L \; new-window -c '#{pane_current_path}' \; split-window -h -c '#{pane_current_path}' \; select-pane -L \; select-window -t 3 \; select-pane -L \;  select-window -t 2 \; select-pane -L \;  select-window -t 1 \; select-pane -L \; attach
        tmux new-session -d \; split-window -h -c '#{pane_current_path}' \; select-pane -L \; attach
    fi
    # if command -v tmux &> /dev/null && ! [ -z "$TMUX" ]; then

    #     #tmux new-session -d \; split-window -h -c '#{pane_current_path}' \; select-pane -L \; new-window -c '#{pane_current_path}' \; split-window -h -c '#{pane_current_path}' \; select-pane -L \; new-window -c '#{pane_current_path}' \; split-window -h -c '#{pane_current_path}' \; select-pane -L \; select-window -t 3 \; select-pane -L \;  select-window -t 2 \; select-pane -L \;  select-window -t 1 \; select-pane -L \; attach
    #     #tmux new-session -d \; split-window -h -c '#{pane_current_path}' \; select-pane -L \; attach
    # fi
fi

if command -v tmux &> /dev/null && ! [ -z "$TMUX" ]; then
    fish && exit
fi