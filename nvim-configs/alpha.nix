{ pkgs, ... }: {
  plugins = {
    alpha = {
      enable = false;

      # Layout for the alpha-nvim configuration
      layout = [
  # Padding before the header
  {
    type = "padding";
    val = 2;
  }

  # Header section
  {
    opts = {
      hl = "Type";
      position = "center";
    };
    type = "text";
    val = [
      " /$$$$$$$$                                                                      /$$$$$$$$  "
      "| $$_____/                                                                      |_____ $$  "
      "| $$       /$$$$$$/$$$$   /$$$$$$   /$$$$$$   /$$$$$$$  /$$$$$$  /$$$$$$$            /$$/  "
      "| $$$$$   | $$_  $$_  $$ /$$__  $$ /$$__  $$ /$$_____/ /$$__  $$| $$__  $$          /$$/   "
      "| $$__/   | $$ \\ $$ \\ $$| $$$$$$$$| $$  \\__/|  $$$$$$ | $$  \\ $$| $$  \\ $$         /$$/    "
      "| $$      | $$ | $$ | $$| $$_____/| $$       \\____  $$| $$  | $$| $$  | $$        /$$/     "
      "| $$$$$$$$| $$ | $$ | $$|  $$$$$$$| $$       /$$$$$$$/|  $$$$$$/| $$  | $$       /$$$$$$$$|"
      "|________/|__/ |__/ |__/ \\_______/|__/      |_______/  \\______/ |__/  |__/      |________/ "
    ];
  }

  # Padding between the header and buttons
  {
    type = "padding";
    val = 2;
  }

  # Buttons group
  { 
    opts = {
      hl = "Type";
      position = "center";
    };

    type = "group";
    val = [
      {
        type = "button";
        val = "󰦛 Restore session";
        opts = {
          shortcut = "r";
        };
        on_press = {
          __raw = "function() vim.cmd[[SessionRestore]] end";
        };
      }
      {
        type = "button";
        val = "󱎰 Find session";
        opts = {
          shortcut = "s";
        };
        on_press = {
          __raw = "function() require('auto-session.session-lens').search_session() end";
        };
      }
      {
        type = "button";
        val = "󰱼 Find file";
        opts = {
          shortcut = "f";
        };
        on_press = {
          __raw = "function() vim.cmd[[Telescope find_files]] end";
        };
      }
      {
        type = "button";
        val = "󱎸 Find text";
        opts = {
          shortcut = "t";
        };
        on_press = {
          __raw = "function() vim.cmd[[Telescope live_grep]] end";
        };
      }
      {
        type = "button";
        val = "󰈔 New file";
        opts = {
          shortcut = "n";
        };
        on_press = {
          __raw = "function() vim.cmd[[ene | startinsert]] end";
        };
      }
      {
        type = "button";
        val = "󱑒 Recently opened files";
        opts = {
          shortcut = "o";
        };
        on_press = {
          __raw = "function() vim.cmd[[Telescope oldfiles]] end";
        };
      }
      {
        type = "button";
        val = " Update Plugins";
        opts = {
          shortcut = "u";
        };
        on_press = {
          __raw = "function() vim.cmd[[Lazy sync]] end";
        };
      }
      {
        type = "button";
        val = " Quit";
        opts = {
          shortcut = "q";
        };
        on_press = {
          __raw = "function() vim.cmd[[qa]] end";
        };
      }
    ];
  }

  # Padding between buttons and footer
  {
    type = "padding";
    val = 2;
  }

  # Footer section
  {
    opts = {
      hl = "Keyword";
      position = "center";
    };
    type = "text";
    val = "Emerson Zapata";
  }
];
    };
  };
}

