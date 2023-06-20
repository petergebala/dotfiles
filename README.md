Dotfiles by Peter Gębala
========

#### Installation
Run: `install.sh`
#### Vim smart usage:
##### General:
    \                                       # leader key
    *                                       # highlight current word
    %s/old/new/gc                           # Rename variable in file with confirmation
    f                                       # Find after cursor
    F                                       # Find before cursor
    zc                                      # Close current fold
    zo                                      # Open current fold
    za                                      # Toggle current fold
    zC                                      # Close all folds in file
    zO                                      # Opens all folds in file
    zA                                      # Toggles all folds in file
    zR                                      # Opens all folds to 0
    zd                                      # Deletes fold at cursor
    z#                                      # Deletes all folds
    z=                                      # Spell suggestions
    zg                                      # Marks a word under the cursor as a good one
    zw                                      # Marks a word under the cursor as a wrong one

##### Treesitter
    TSInstallInfo                           # List of installed language parsers
    TSInstall language                      # Install language parser

##### HOP
    HopChar1
    HopPattern
    HopWord

##### Trouble
    <leader>tt                              # Toggle trouble

#### AutoPairs
    <alt>e                                  # Asks where to put ending

#### MatchUp
    %                                       # Switch between matched word

##### Autocomplete:

    bundle install --path vendor            # Adds gems to vendor
    ctags -R --exclude=.git --exclude=log * # Generates ctags

in insert mode:

    ctrl+space
    gd                                      # moves to method definition
    gD                                      # moves to method declaration
    gf                                      # moves to file
    gr                                      # check references
    K                                       # documentation

##### FZF:

    :Files                                  # find file
    :GFiles                                 # git ls-files
    :BLines                                 # lines in buffer (opened file)
    :Ag                                     # find inside file

##### Change inside:

    iw                                      # in word
    ciw                                     # Change inside word
    ci"                                     # Change inside "
    da"                                     # Delete around "
    c7k                                     # change 7 lines above
    cit                                     # change inside <tag>

##### Snippets:
##### Surround:

    ysiw]                                   # surround with []
    cs'"                                    # change ' -> "
    ds"                                     # delete "
    cst                                     # chage surrounding tag

#### Gitsigns:

    :Gitsigns diffthis

##### Tabular:

    :Tabularize /regex/options

Options are:

    l - left aligning
    r - right aligning
    c - right aligning
    number following the letter is the number of spaces padding to insert before the start of the next field

Example:

    :Tabularize /,/r1c1l0

##### Markers

    ma                                            # marker under letter a. Capital letter for spanning across files
    'a                                            # go to line under marker a
    `a                                            # go to exact position of marker a
    :marks                                        # list of markers

##### Other:

    :ls                                           # list elements in buffer
    :b file                                       # back to file
    g^]                                           # list of matching definitions ctags
    ^x^f                                          # complete for file names
    "ya                                           # copy to register a
    "pa                                           # paste from register a
    :reg                                          # list registers
    Ctrl"                                         # enter register mode
    args `command which return files`
    argdo %s/a/b/g | w                            # Each file in buffer substitute a to b and write file

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

##### Plugins

    prefix + I                                    # Installs plugins
    prefix + U                                    # Updates plugins
    prefix + alt + u                              # Installs/uninstalls plugins

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
