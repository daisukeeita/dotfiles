if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

export PATH="$PATH:/opt/nvim/"

set PATH ~/.nvm/versions/node/v20.17.0/bin $PATH

