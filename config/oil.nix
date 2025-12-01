{ pkgs, ... }:
{

  plugins.oil = {
    enable = true;

    luaConfig.post = ''
      local detail = false

      require("oil").setup({
        keymaps = {
          ["gd"] = {
            desc = "Toggle file detail view",
            callback = function()
              detail = not detail
              if detail then
                require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
              else
                require("oil").set_columns({ "icon" })
              end
            end,
          },
        },
      })
    '';
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>pv";
      options.silent = true;
      action = "<cmd>Oil<CR>";
    }
  ];
}
