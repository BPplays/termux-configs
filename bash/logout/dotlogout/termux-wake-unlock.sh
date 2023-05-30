for i in 1 2 3
 do
    if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
        # echo "iter $i"
        sleep 5
        if [ $(pgrep sshd | wc -l) -lt 2 ]; then
            termux-wake-unlock
            # echo "termux-wake-unlock"
        fi
    fi
done