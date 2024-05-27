{
  plugins = {
    lsp-format = {enable = true;};
    lsp = {
      enable = true;
      keymaps = {
        silent = true;

        diagnostic = {
          "<leader>dp" = "goto_prev";
          "<leader>dn" = "goto_next";
        };

        lspBuf = {
          "gd" = "definition";
          "gt" = "type_definition";
          "gi" = "implementation";
          "K" = "hover";
          "<leader>ca" = "code_action";
          "<leader>rn" = "rename";
        };
      };

      # https://github.com/nix-community/nixvim/blob/main/plugins/lsp/default.nix
      servers = {
        ansiblels = {enable = true;};
        eslint = {enable = true;};
        html = {enable = true;};
        lua-ls = {enable = true;};
        nil_ls = {enable = true;};
        marksman = {enable = true;};
        pyright = {enable = true;};
        lemminx = {enable = true;};
        svelte = {enable = true;};
        gopls = {enable = true;};
        tsserver = {enable = false;};
        rust-analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };
        yamlls = {
          enable = true;
        };
      };
    };
  };
}
