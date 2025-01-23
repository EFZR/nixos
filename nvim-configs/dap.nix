{ lib, pkgs, ... }:
let
  coreclr-config = [
    {
      type = "coreclr";
      name = "launch - netcoredbg";
      request = "launch";
      program.__raw = ''
        function()
            -- return vim.g.dotnet_select_project()
            if vim.fn.confirm("Should I recompile first?", "&yes\n&no", 2) == 1 then
                vim.g.dotnet_build_project()
            end
            
            return vim.g.dotnet_select_project()
        end
      '';
      stopOnEntry = false;
    }
    {
      type = "coreclr";
      name = "attach - netcoredbg";
      request = "attach";
      processId.__raw = ''require("dap.utils").pick_process'';
    }
  ];

in {
  plugins = {
    dap = {
      adapters = {
        executables = {
          coreclr = {
            command = lib.getExe pkgs.netcoredbg;
            args = [ "--interpreter=vscode" ];
          };
        };
      };

      configurations = { cs = coreclr-config; };

      extensions = {
        dap-ui = { enable = true; };
        dap-virtual-text = { enable = true; };
      };

      signs = {
        dapBreakpoint = {
          text = "";
          texthl = "DapBreakpoint";
        };
        dapBreakpointCondition = {
          text = "";
          texthl = "dapBreakpointCondition";
        };
        dapBreakpointRejected = {
          text = "";
          texthl = "DapBreakpointRejected";
        };
        dapLogPoint = {
          text = "";
          texthl = "DapLogPoint";
        };
        dapStopped = {
          text = "";
          texthl = "DapStopped";
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<F5>";
      action.__raw = ''
        function()
          require("dap").continue()
        end
      '';
      options = {
        desc = "Continue Debugging";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<F6>";
      action.__raw = ''
        function()
          require("dap").restart()
        end
      '';
      options = {
        desc = "Restart Debugging";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<F10>";
      action.__raw = ''
        function()
          require("dap").step_over()
        end
      '';
      options = {
        desc = "Step Over";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<F11>";
      action.__raw = ''
        function()
          require("dap").step_into()
        end
      '';
      options = {
        desc = "Step Into";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<F12>";
      action.__raw = ''
        function()
          require("dap").step_out()
        end
      '';
      options = {
        desc = "Step Out";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<Leader>b";
      action.__raw = ''
        function()
          require("dap").toggle_breakpoint()
        end
      '';
      options = {
        desc = "Toggle Breakpoint";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<Leader>lp";
      action.__raw = ''
        function()
          require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
        end
      '';
      options = {
        desc = "Set Log Point";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<Leader>dr";
      action.__raw = ''
        function()
          require("dap").repl.toggle()
        end
      '';
      options = {
        desc = "Toggle REPL";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<Leader>dl";
      action.__raw = ''
        function()
          require("dap").run_last()
        end
      '';
      options = {
        desc = "Run Last Debugging Session";
        silent = true;
      };
    }
    {
      mode = [ "n" "v" ];
      key = "<Leader>dh";
      action.__raw = ''
        function()
          require("dap.ui.widgets").hover()
        end
      '';
      options = {
        desc = "Hover Debug Info";
        silent = true;
      };
    }
    {
      mode = [ "n" "v" ];
      key = "<Leader>dp";
      action.__raw = ''
        function()
          require("dap.ui.widgets").preview()
        end
      '';
      options = {
        desc = "Preview Debug Info";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<Leader>df";
      action.__raw = ''
        function()
          local widgets = require("dap.ui.widgets")
          widgets.centered_float(widgets.frames)
        end
      '';
      options = {
        desc = "Show Frames in Centered Float";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<Leader>ds";
      action.__raw = ''
        function()
          local widgets = require("dap.ui.widgets")
          widgets.centered_float(widgets.scopes)
        end
      '';
      options = {
        desc = "Show Scopes in Centered Float";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-n>";
      action.__raw = ''
        function()
          require("dapui").toggle() 
        end
      '';
      options = {
        desc = "Show Scopes in Centered Float";
        silent = true;
      };
    }
  ];
}
