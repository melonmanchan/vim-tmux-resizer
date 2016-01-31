# Vim Tmux Resizer
Resize tmux panes and vim splits with Alt + hjkl! Plays well with vim-tmux-navigator

# Installation

## Tmux
Add the following lines to your .tmux.conf file

```tmux
is_vim='echo "#{pane_current_command}" | grep -iqE "(^|\/)g?(view|n?vim?x?)(diff)?$"'

bind -n M-h if-shell "$is_vim" "send-keys M-h" "resize-pane -L 10"
bind -n M-l if-shell "$is_vim" "send-keys M-l" "resize-pane -R 10"
bind -n M-k if-shell "$is_vim" "send-keys M-k" "resize-pane -U 5"
bind -n M-j if-shell "$is_vim" "send-keys M-j" "resize-pane -D 5"
```

