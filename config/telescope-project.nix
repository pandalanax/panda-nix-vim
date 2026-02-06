{ config, lib, pkgs, ... }:

{
  extraPlugins = [(pkgs.vimUtils.buildVimPlugin {
    name = "telescope-project.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope-project.nvim";
      rev = "8e11df94419e444601c09828dadf70890484e443";
      hash = "sha256-RyrfT/uQmuer+WN9Q58InTkuFJO+VQvVsp0ZRpRp7PQ=";
    };
  })]; 
  extraConfigLua = ''
require'telescope'.load_extension('project')
'';
}
