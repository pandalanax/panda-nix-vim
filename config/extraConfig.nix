{pkgs, ...}: {
  extraPlugins = [pkgs.vimPlugins.nvim-surround];
  extraConfigLua = ''
    local surround = require("nvim-surround")
    surround.setup({
      keymaps = {
        insert = "<C-g>z",
        insert_line = "gC-ggZ",
        normal = "z",
        normal_cur = "Z",
        normal_line = "gzgz",
        normal_cur_line = "gZgZ",
        visual = "z",
        visual_line = "Z",
        delete = "dz",
        change = "cz",
      },
    })

    local augroup = vim.api.nvim_create_augroup
    local autocmd = vim.api.nvim_create_autocmd
    local yank_group = augroup("HighlightYank", {})

    autocmd("TextYankPost", {
    	group = yank_group,
    	pattern = "*",
    	callback = function()
    		vim.highlight.on_yank({
    			higroup = "IncSearch",
    			timeout = 40,
    		})
    	end,
    })
    local lastplace = vim.api.nvim_create_augroup("LastPlace", {})
    vim.api.nvim_clear_autocmds({ group = lastplace })
    vim.api.nvim_create_autocmd("BufReadPost", {
    	group = lastplace,
    	pattern = { "*" },
    	desc = "remember last cursor place",
    	callback = function()
    		local mark = vim.api.nvim_buf_get_mark(0, '"')
    		local lcount = vim.api.nvim_buf_line_count(0)
    		if mark[1] > 0 and mark[1] <= lcount then
    			pcall(vim.api.nvim_win_set_cursor, 0, mark)
    		end
    	end,
    })

  '';
}
