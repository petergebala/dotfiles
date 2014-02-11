Dotfiles by Peter Gębala
========

#### Installation
Run: `install.sh`
#### Vim smart usage:
##### Autocomplete:

    bundle install --path vendor            # Adds gems to vendor
    ctags -R --exclude=.git --exclude=log * # Generates ctags

in insert mode:

    ctrl+p                                  # Shows autocomplete menu
    ctrl+n                                  # Next selection
    ctrl+p                                  # previous selection
    ctrl+}                                  # moves to method definition

##### CtrlP in command mode:

    ctrl+p                                  # find file

##### Change inside:

    ciw                                     # Change inside word
    ci"                                     # Change inside "
    da"                                     # Delete around "

##### Snippets:
##### Surround:

    ysiw]                                   # surround with []
    cs'"                                    # change ' -> "
    ds"                                     # delete "

##### Tabular:

    :Tabularize /regex/options

Options are:

    l - left aligning
    r - right aligning
    c - right aligning
    number following the letter is the number of spaces padding to insert before the start of the next field

Example:

    :Tabularize /,/r1c1l0

##### Other:

    args `command which return files`
    argdo %s/a/b/g | w                            # Each file in buffer substitude a to b and write file

#### Tmux cheatsheet
##### General:

    tmux new -s session_name                      # New session
    tmux -S /tmp/file_name new -d -s session_name # Save session to file
    tmux -S /tmp/file_name attach                 # Load session from file
    tmux a -t session_name                        # Attach to existing session
    tmux ls                                       # List all sessions
    tmux kill-session -t session_name             # Kill session
    Ctrl-a d                                      # Detach current client
    Ctrl-a ,                                      # Rename the current window

##### Sessions:

    :new<CR>                                      # new session
    s                                             # list sessions
    $                                             # name session
    ?                                             # list shortcuts

##### Windows:

    c                                             # new window
    w                                             # list windows
    f                                             # find window
    ,                                             # name window
    &                                             # kill window

##### Pane:

    -                                             # split pane horizontally.
    |                                             # split pane vertically.
    o                                             # swap panes
    q                                             # show pane numbers
    x                                             # kill pane
