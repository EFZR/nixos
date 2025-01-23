{
  autoCmd = [
    {
      event = [ "TextYankPost" ];
      callback = {
        __raw = ''
          function()
          		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
          end
        '';
      };
      desc = "Briefly highlight yanked text";
    }
    {
      event = "FileType";
      pattern = "html";
      callback = {
        __raw = ''
          function()
            vim.opt_local.shiftwidth = 2
            vim.opt_local.tabstop = 2
          end
        '';
      };
      desc = "Set indentation for the html files";
    }
    {
      event = "FileType";
      pattern = "cs";
      callback = {
        __raw = ''
          function()
            vim.opt_local.shiftwidth = 4
            vim.opt_local.tabstop = 4
          end
        '';
      };
      desc = "Set indentation for the csharp files";
    }
    {
      event = "FileType";
      pattern = "py";
      callback = {
        __raw = ''
          function()
            vim.opt_local.shiftwidth = 4
            vim.opt_local.tabstop = 4
          end
        '';
      };
      desc = "Set indentation for the python files";
    }
    {
      event = "FileType";
      pattern = "rs";
      callback = {
        __raw = ''
          function()
            vim.opt_local.shiftwidth = 4
            vim.opt_local.tabstop = 4
          end
        '';
      };
      desc = "Set indentation for the rust files";
    }
    {
      event = "FileType";
      pattern = "ts";
      callback = {
        __raw = ''
          function()
            vim.opt_local.shiftwidth = 2
            vim.opt_local.tabstop = 2
          end
        '';
      };
      desc = "Set indentation for typescript files";
    }
    {
      event = "FileType";
      pattern = "tsx";
      callback = {
        __raw = ''
          function()
            vim.opt_local.shiftwidth = 2
            vim.opt_local.tabstop = 2
          end
        '';
      };
      desc = "Set indentation for typescript react files";
    }
    {
      event = "FileType";
      pattern = "js";
      callback = {
        __raw = ''
          function()
            vim.opt_local.shiftwidth = 2
            vim.opt_local.tabstop = 2
          end
        '';
      };
      desc = "Set indentation for javascript files";
    }
    {
      event = "FileType";
      pattern = "jsx";
      callback = {
        __raw = ''
          function()
            vim.opt_local.shiftwidth = 2
            vim.opt_local.tabstop = 2
          end
        '';
      };
      desc = "Set indentation for javascript react files";
    }
    {
      event = "FileType";
      pattern = "nix";
      callback = {
        __raw = ''
          function()
            vim.opt_local.shiftwidth = 2
            vim.opt_local.tabstop = 2
          end
        '';
      };
      desc = "Set indentation for nix files";
    }
  ];
}
