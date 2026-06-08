# Neovim Architecture Reference

A high-performance configuration built with Neovim native primitives and the mini.nvim layer. Adapts between local desktop setups and mobile terminal layers inside Termux on Android.

## Functional Keys Cheat Sheet

### View Control & Operations
* C-h / C-j / C-k / C-l : Focus navigation between splits (Left, Down, Up, Right)
* leader + S-           : Horizontal split view layout
* leader + S\           : Vertical split view layout
* - or leader + oo      : Launch Oil explorer context
* leader + of           : Floating window directory lookup orientation

### File Operations
* leader + ww : Save active buffer alterations
* leader + wa : Broad save across all files in workspace memory
* leader + wq : Write out allocations and terminate editor process
* leader + q  : Direct view panel deletion

### Buffer & Workspace Operations
* Tab        : Cycle forward across target buffers
* Shift+Tab  : Cycle backwards across target buffers
* leader + bd : Remove current workspace buffer from tracking without splitting views
* leader + hh : Trigger Snipe home-row navigation mapping matrix

### Language Analytics & Telescope Hook Targets
* gd         : Go to source target declaration site
* gr         : Locate structural variable references tree
* K          : Invoke documentation tracking overview overlay
* leader + ca: Execute context-level code fixes

## Popup Menu Interface Interaction Structure
When typing prompts or variables within an open LSP context buffer, a classic dropdown window appears automatically:
* Tab       : Progress downward into context elements
* Shift+Tab : Navigate upward into context elements
* Enter     : Select active list object cleanly without adding layout returns
