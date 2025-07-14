{pkgs, ...}: {
  plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>sg" = "live_grep";
      "<leader>sf" = "find_files";
      #"<C-p>" = {
      #  action = "git_files";
      #  desc = "Telescope Git Files";
      #};
    };
    extensions.fzf-native = {enable = true;};
  };
  plugins.web-devicons.enable = true;
  extraPlugins = with pkgs; [
    vimPlugins.nvim-web-devicons
  ];
}
