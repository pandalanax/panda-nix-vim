{
  config,
  lib,
  ...
}: {
  plugins.dap = {
    enable = true;
    configurations = {
    };
  };

  # Optional: UI for DAP
  plugins.dap-ui.enable = true;

  plugins.dap-go = {
    enable = true;
    autoLoad = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<F5>";
      action = ":lua require'dap'.continue()<CR>";
      options = {
        silent = true;
        desc = "DAP: Start/Continue";
      };
    }
    {
      mode = "n";
      key = "<F10>";
      action = ":lua require'dap'.step_over()<CR>";
      options = {
        silent = true;
        desc = "DAP: Step Over";
      };
    }
    {
      mode = "n";
      key = "<F11>";
      action = ":lua require'dap'.step_into()<CR>";
      options = {
        silent = true;
        desc = "DAP: Step Into";
      };
    }
    {
      mode = "n";
      key = "<F12>";
      action = ":lua require'dap'.step_out()<CR>";
      options = {
        silent = true;
        desc = "DAP: Step Out";
      };
    }
    {
      mode = "n";
      key = "<Leader>b";
      action = ":lua require'dap'.toggle_breakpoint()<CR>";
      options = {
        silent = true;
        desc = "DAP: Toggle Breakpoint";
      };
    }
    {
      mode = "n";
      key = "<Leader>dt";
      action = ":lua require('dap-go').debug_test()<CR>";
      options = {
        silent = true;
        desc = "DAP-Go: Debug Test";
      };
    }
    {
      mode = "n";
      key = "<Leader>du";
      action = ":lua require'dapui'.toggle()<CR>";
      options = {
        silent = true;
        desc = "DAP-UI: Toggle";
      };
    }
  ];
}
