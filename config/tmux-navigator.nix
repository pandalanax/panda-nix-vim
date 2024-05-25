{
  plugins = {
    tmux-navigator = {
      enable = true;

      settings = {
        no_wrap = true;
        disable_when_zoomed = true;
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<m-n>";
      action = "<cmd>TmuxNavigateLeft<cr>";
      options = {
        silent = true;
        desc = "Navigate left";
      };
    }
    {
      mode = "n";
      key = "<m-e>";
      action = "<cmd>TmuxNavigateDown<cr>";
      options = {
        silent = true;
        desc = "Navigate down";
      };
    }
    {
      mode = "n";
      key = "<m-i>";
      action = "<cmd>TmuxNavigateUp<cr>";
      options = {
        silent = true;
        desc = "Navigate up";
      };
    }
    {
      mode = "n";
      key = "<m-o>";
      action = "<cmd>TmuxNavigateRight<cr>";
      options = {
        silent = true;
        desc = "Navigate right";
      };
    }
  ];
}
