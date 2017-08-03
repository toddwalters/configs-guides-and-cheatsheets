# tmux cheatsheet
The formatting here is simple enough to understand (I would hope). C means ctrl+, so C-x is ctrl+x. M- means meta (generally left-alt or escape)+, so M-x is left-alt+x
(C-x means ctrl+x, M-x means alt+x)

## Prefix key
The default prefix is C-b. If you (or your muscle memory) prefer C-a, you need to add this to `~/.tmux.conf`:

    # remap prefix to Control + a
    set -g prefix C-a
    # bind 'C-a C-a' to type 'C-a'
    bind C-a send-prefix
    unbind C-b

This cheatsheet assumes that C-a is your prefix.

Any command mentioned in this list can be executed as `tmux something` or `C-a :something` (or added to `~/.tmux.conf`).

## Sessions, windows, panes

**_Session_** is a set of windows, plus a notion of which window is current.

**_Window_** is a single screen covered with panes. (Once might compare it to a ‘virtual desktop’ or a ‘space’.)

**_Pane_** is a rectangular part of a window that runs a specific command, e.g. a shell.

## Getting help
Display a list of keyboard shortcuts:
`C-a ?`

## Navigate using Vim or Emacs shortcuts
Emacs is the default, and if you want Vim shortcuts for help and copy modes (e.g. j, k, C-u, C-d), add the following line to `~/.tmux.conf`:

    setw -g mode-keys vi

## start new session:
`tmux`

## start new with session name:
`tmux new -s myname`

## attach:
`tmux a  #`  (or at, or attach)

## attach to named:
`tmux a -t myname`

## list sessions:
`tmux ls`

## detach from an active session:
`C-a d` 
`C-a :detach`

## kill session:
`tmux kill-session -t myname`

## Kill all the tmux sessions:
`tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill`

## Sessions

    :new<CR>  new session
    s  list sessions
    $  name session

## Windows (tabs)

    c  create window
    w  list windows
    n  next window
    p  previous window
    f  find window
    ,  name window
    &  kill window

## Panes (splits) 

    %  vertical split
    "  horizontal split
    
    o  swap panes
    q  show pane numbers
    x  kill pane
    +  break pane into window (e.g. to select text by mouse to copy)
    -  restore pane from window
    ⍽  space - toggle between layouts
    <prefix> q (Show pane numbers, when the numbers show up type the key to goto that pane)
    <prefix> { (Move the current pane left)
    <prefix> } (Move the current pane right)
    <prefix> z toggle pane zoom

## Sync Panes 

You can do this by switching to the appropriate window, typing your Tmux prefix (commonly Ctrl-B or Ctrl-A) and then a colon to bring up a Tmux command line, and typing:

```
:setw synchronize-panes
```

You can optionally add on or off to specify which state you want; otherwise the option is simply toggled. This option is specific to one window, so it won’t change the way your other sessions or windows operate. When you’re done, toggle it off again by repeating the command. [tip source](http://blog.sanctum.geek.nz/sync-tmux-panes/)


## Copy mode:

Pressing PREFIX [ places us in Copy mode. We can then use our movement keys to move our cursor around the screen. By default, the arrow keys work. we set our configuration file to use Vim keys for moving between windows and resizing panes so we wouldn’t have to take our hands off the home row. tmux has a vi mode for working with the buffer as well. To enable it, add this line to .tmux.conf:

    setw -g mode-keys vi

With this option set, we can use h, j, k, and l to move around our buffer.

To get out of Copy mode, we just press the ENTER key. Moving around one character at a time isn’t very efficient. Since we enabled vi mode, we can also use some other visible shortcuts to move around the buffer.

For example, we can use "w" to jump to the next word and "b" to jump back one word. And we can use "f", followed by any character, to jump to that character on the same line, and "F" to jump backwards on the line.

       Function                vi             emacs
       Back to indentation     ^              M-m
       Clear selection         Escape         C-g
       Copy selection          Enter          M-w
       Cursor down             j              Down
       Cursor left             h              Left
       Cursor right            l              Right
       Cursor to bottom line   L
       Cursor to middle line   M              M-r
       Cursor to top line      H              M-R
       Cursor up               k              Up
       Delete entire line      d              C-u
       Delete to end of line   D              C-k
       End of line             $              C-e
       Goto line               :              g
       Half page down          C-d            M-Down
       Half page up            C-u            M-Up
       Next page               C-f            Page down
       Next word               w              M-f
       Paste buffer            p              C-y
       Previous page           C-b            Page up
       Previous word           b              M-b
       Quit mode               q              Escape
       Scroll down             C-Down or J    C-Down
       Scroll up               C-Up or K      C-Up
       Search again            n              n
       Search backward         ?              C-r
       Search forward          /              C-s
       Start of line           0              C-a
       Start selection         Space          C-Space
       Transpose chars                        C-t

If you have vi style key bindings on then the following applies:

1) enter copy mode using `C-b [`
2) navigate to beginning of text, you want to select and hit **Space**
3) move around using arrow keys to select region
4) when you reach end of region simply hit **Enter** to copy the region
5) now `C-b ]` will paste the selection

Dump what you copied out to your terminal using:

`tmux show-buffer`

Save what you copied to a file (say, foo.txt):

`tmux save-buffer foo.txt`

To see all the paste buffers try Control + b #. To dump out the varios buffers on to the terminal or file you may use

```bash
tmux list-buffers
tmux show-buffer -b n
tmux save-buffer -b n foo.txt
```

where `n` is the index of the paste buffer.

## Misc

    d  detach
    t  big clock
    ?  list shortcuts
    :  prompt

## Configurations Options:

    # Mouse support - set to on if you want to use the mouse
    * setw -g mode-mouse off
    * set -g mouse-select-pane off
    * set -g mouse-resize-pane off
    * set -g mouse-select-window off

    # enable activity alerts
    setw -g monitor-activity on
    set -g visual-activity on

    # Center the window list
    set -g status-justify centre

## Notes:

* 

## Changelog:
