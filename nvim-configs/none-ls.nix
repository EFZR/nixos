{
  plugins = {
    none-ls = {
      enable = true;
      settings = {
        code_actions = { gitsigns.enable = true; };
        formatting = {
          prettier.enable = true;
          stylua.enable = true;
          csharpier.enable = true;
          markdownlint.enable = true;
          eslint_d.enable = true;
          nixpkgs_fmt.enable = true;
        };
        completion = { luasnip.enable = true; };
      };
    };
  };

  keymaps = [{
    mode = "n";
    key = "<leader>lf";
    action = "<cmd>lua vim.lsp.buf.format{ async = true }<CR>";
    options = { desc = "Format"; };
  }];
}
