{ pkgs, ... }: {
  plugins = {
    treesitter = {
      enable = true;

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        bash
        json
        lua
        make
        markdown
        nix
        regex
        toml
        vim
        vimdoc
        xml
        yaml
        c_sharp
        javascript
        typescript
        tsx
        html
        css
        http
      ];

      settings = {
        auto_install = false;
        highlight = {
          additional_vim_regex_highlighting = false;
          custom_captures = { };
          enable = true;
        };
        incremental_selection = { enable = true; };
        indent = { enable = true; };
        parser_install_dir = {
          __raw = "vim.fs.joinpath(vim.fn.stdpath('data'), 'treesitter')";
        };
        sync_install = false;
      };
    };
  };
}
