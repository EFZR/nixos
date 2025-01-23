{
  plugins = {
    neogit = {
      enable = true;
      settings = { auto_refresh = true; };
    };
  };

  keymaps = [{
    mode = "n";
    key = "<leader>G";
    action = "<cmd>Neogit<CR>";
    options = { desc = "Neogit"; };
  }];
}
