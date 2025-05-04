if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting ""

fish_add_path ~/.local/bin

oh-my-posh init fish --config ~/.config/oh-my-posh/catppuccin_macchiato.json | source