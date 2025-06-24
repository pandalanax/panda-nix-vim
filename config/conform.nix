{pkgs, ...}: {
  plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = {
        lspFallback = true;
        timeoutMs = 500;
      };

      formatters-by-ft = {
        html = [["prettierd" "prettier"]];
        css = [["prettierd" "prettier"]];
        javascript = [["prettierd" "prettier"]];
        javascriptreact = [["prettierd" "prettier"]];
        typescript = [["prettierd" "prettier"]];
        typescriptreact = [["prettierd" "prettier"]];
        json = [["prettierd"]];
        yaml = [["prettierd"]];
        python = ["black"];
        lua = ["stylua"];
        nix = ["alejandra"];
        markdown = [["prettierd" "prettier"]];
        rust = ["rustfmt"];
      };
      notify-on-error = true;
    };
  };
  extraPackages = with pkgs; [
    gofumpt
    stylua
    prettierd
    xmlformat
    alejandra
    rustfmt
  ];
}
