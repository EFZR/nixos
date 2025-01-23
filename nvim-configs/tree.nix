{
  plugins = {
    neo-tree = {
      enable = true;
      window = { position = "right"; };
      eventHandlers = {
        file_opened = ''
          function()
          --auto close
          vim.cmd("Neotree close")
          end
        '';
      };
    };
  };
  keymaps = [{
    mode = "n";
    key = "<leader>t";
    action = "<cmd>Neotree reveal toggle<CR>";
    options = { desc = "Explorer toggle"; };
  }];
}
