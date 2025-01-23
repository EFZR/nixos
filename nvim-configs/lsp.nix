{ config, ... }: {
  imports = [ ./lsp/nil.nix ./lsp/omnisharp.nix ];

  plugins = {
    lsp = {
      enable = true;
      inlayHints = true;

      keymaps = {
        silent = true;
        diagnostic = {
          "[d" = "goto_prev";
          "]d" = "goto_next";
          "gl" = "open_float";
        };

        lspBuf = {
          "gd" = "definition";
          "gD" = "references";
          "gh" = "hover";
          "gi" = "implementation";
          "gr" = "rename";
          "gt" = "type_definition";
          "ga" = "code_action";
        };
      };

      servers = {
        bashls.enable = true;
        cssls.enable = true;
        dockerls.enable = true;
        omnisharp.enable = true;
        html.enable = true;
        jsonls.enable = true;
        lua_ls.enable = true;
        marksman.enable = true;
        pyright.enable = true;
        sqls.enable = true;
        tailwindcss.enable = true;
        ts_ls.enable = !config.plugins.typescript-tools.enable;
      };
    };
  };
}

