# Check if the session is initiated via SSH
if [[ -n $SSH_CLIENT ]] || [[ -n $SSH_TTY ]]; then
#echo ssh
    termux-wake-lock &
    if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
        tmux new && exit
    fi
fi
#fish && exit
if ! [[ -n $SSH_CLIENT ]] || ! [[ -n $SSH_TTY ]]; then
#echo ssh
    if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
        tmux new-session -d \; split-window -h -c '#{pane_current_path}' \; select-pane -L \; attach
    fi
fi

if command -v tmux &> /dev/null && ! [ -z "$TMUX" ]; then
    fish && exit
fi