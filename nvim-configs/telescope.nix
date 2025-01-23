{
  plugins = {
    telescope = {
      enable = true;
      extensions = {
        fzf-native = {
          enable = true;
          settings = {
            case_mode = "smart_case";
            fuzzy = true;
            override_file_sorter = true;
            override_generic_sorter = true;
          };
        };
        live-grep-args.enable = true;
        ui-select = {
          enable = true;
          settings = {
            __unkeyed-1.__raw = ''require("telescope.themes").get_dropdown{}'';
          };
        };
      };

      keymaps = {

        "<leader>fb" = {
          action = "buffers";
          options.desc = "View buffers";
        };
        "<leader>ff" = {
          action = "find_files";
          options.desc = "Find files";
        };
        "<leader>fh" = {
          action = "help_tags";
          options.desc = "View help tags";
        };
        "<leader>fk" = {
          action = "keymaps";
          options.desc = "View keymaps";
        };

        "<leader>fq" = {
          action = "quickfix";
          options.desc = "Search quickfix";
        };
        "<leader>fg" = {
          action = "live_grep";
          options.desc = "Live grep";
        };

        "<leader>gB" = {
          action = "git_branches";
          options.desc = "View git branches";
        };
        "<leader>gC" = {
          action = "git_commits";
          options.desc = "View git commits";
        };
        "<leader>gs" = {
          action = "git_status";
          options.desc = "View git status";
        };
        "<leader>gS" = {
          action = "git_stash";
          options.desc = "View git stashes";
        };
      };

      settings = {
        defaults = {
          file_ignore_patterns = [
            "^.git/"
            "^.mypy_cache/"
            "^__pycache__/"
            "^output/"
            "^data/"
            "%.ipynb"
            "^node_modules/"
            ".sln"
          ];
        };
        pickers = {
          find_files = {
            theme = "dropdown";
            previewer = false;
            hidden = true;
          };
        };

      };
    };
  };
}

