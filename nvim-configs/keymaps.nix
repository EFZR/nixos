{
  keymaps = [
    # Better Window Navigation
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options = { desc = "Move to the left window."; };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options = { desc = "Move to the window below."; };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options = { desc = "Move to the window above."; };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options = { desc = "Move to the right window."; };
    }

    # Resize with arrows
    {
      mode = "n";
      key = "<C-Up>";
      action = ":resize -2<CR>";
      options = { desc = "Decrease height."; };
    }
    {
      mode = "n";
      key = "<C-Down>";
      action = ":resize +2<CR>";
      options = { desc = "Increase height."; };
    }
    {
      mode = "n";
      key = "<C-Left>";
      action = ":vertical resize -2<CR>";
      options = { desc = "Decrease width."; };
    }
    {
      mode = "n";
      key = "<C-Right>";
      action = ":vertical resize +2<CR>";
      options = { desc = "Increase width."; };
    }

    # Clear highlights
    {
      mode = "n";
      key = "<leader>h";
      action = ":nohlsearch";
      options = { desc = "Clear search highlights."; };
    }
  ];
}
