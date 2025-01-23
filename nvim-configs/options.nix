{ pkgs, ... }: {
  colorscheme = "gruvbox";
  colorschemes.gruvbox.enable = true;
  colorschemes.vscode.enable = true;

  opts = {
    # Line numbers
    number = true;
    relativenumber = true;

    # Always show the signcolumn, otherwise text would shift when displaying error icons
    signcolumn = "yes";

    # Search
    ignorecase = true;
    smartcase = true;

    # Configure how new splits should be opened
    splitright = true;
    splitbelow = true;

    # Tab and indentation defaults
    tabstop = 2;
    shiftwidth = 2;
    expandtab = true;
    smarttab = true;
    # softtabstop = 0;

    # Highlight the current line for cursor
    cursorline = true;

    # Display settings
    wrap = false;
    scrolloff = 8; # Keep 8 lines above/below the cursor
    sidescrolloff = 8; # Keep 8 columns to the left/right of the cursor
    termguicolors = true; # Enable true color support

    # Save undo history
    undofile = true;

    # Split completion settings
    wildmenu = true;
    wildignorecase = true;
    wildmode = "longest,full,full";

    # Background color
    background = "dark";

    # Disable backup and swap files
    backup = false;
    swapfile = false;
    writebackup = false;

    # Faster update time
    updatetime = 300;

    # Column and ruler settings
    ruler = true;

    # Global substitution by default
    gdefault = true;

    #Clipboard
    clipboard = "unnamedplus";
  };

  globals.mapleader = " "; # Set the leader key

  clipboard.providers.xclip = {
    enable = true;
    package = pkgs.clip;
  };
}

