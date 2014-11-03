shell-environment
=================

My preferred shell environment.

Currently supports debian linux distributions and cygwin.


Quick Reference:

Screen

screen -S <name>    // Start a new screen session with session name
screen -r -d <name> // Re-attach to a screen session

Navigating

C-a c // Create a new window
C-a n // Change to the next window
C-a p // Change to the previous window

,m      Compile using make

jj      Exit insert mode
gt      Goto next tab
gT      Goto previous tab

<leader> te TabEdit: Open a new tab and browse for file
<leader> tn TabNew: Create a new tab

<space>     Starts the forward / search option
<c-space>   Starts backwards ? search option

*       Search for word under cursor

<leader> hm HexManager: Call/Leve Hexmode (using xxd)
<leader> hd HexDelete: delete the hex character under cusor
<leader> hi HexInsert: Insert Ascii character before cursor
<leader> hg HexGoto: Goto hex offset.
<leader> hn HexNext: Goto next hex offset
<leader> hp HexPrev: Goto previous hex offset.
<leader> hs HexStatus: Show / Hide hexoffset infos in statusline and related column

<leader> vo VimGrep: Configure options
<leader> vv VimGrep: Search for text under cursor using vimgrep options

ZZ      Quickly exit window

<insert> <Tab> AutoComplete: Autocomplete the word. Multiple tabs to cycle through selection. Enter to select

