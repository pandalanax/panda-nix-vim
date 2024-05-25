{pkgs, ...}: {
  plugins.oil.enable = true;
  keymaps = [
    {
      mode = "n";
      key = "<leader>pv";
      options.silent = true;
      action = "<cmd>Oil<CR>";
    }
  ];
}
