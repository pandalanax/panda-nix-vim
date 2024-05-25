{pkgs, ...}: {
  extraPlugins = [pkgs.vimPlugins.everforest];
  colorscheme = "everforest";

  globals.everforest_background = "hard"; #
}
