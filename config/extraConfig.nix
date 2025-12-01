{ pkgs, ... }:
{
  extraPlugins = [ pkgs.vimPlugins.nvim-surround ];
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

      vim.keymap.set('n', '<leader>rx', function()
        -- Try to get host from current buffer's stored variable first
        local host = vim.b.ssh_host
        
        -- If not found, try to extract from oil-ssh buffer name
        if not host then
          local bufname = vim.api.nvim_buf_get_name(0)
          host = bufname:match("^oil%-ssh://([^/]+)//")
        end
        
        if not host then
          host = "local"
        end
        
        vim.ui.input({ prompt = host .. ' $ ' }, function(input)
          if input then
            vim.cmd('rightbelow vsplit')
            if host == "local" then
              vim.cmd('terminal ' .. input)
            else
              vim.cmd('terminal ssh -t ' .. host .. ' ' .. input)
            end
            vim.b.ssh_host = host
          end
        end)
      end, { desc = 'Terminal vertical split' })

      vim.keymap.set('n', '<leader>rX', function()
        -- Try to get host from current buffer's stored variable first
      local host = vim.b.ssh_host

      -- If not found, try to extract from oil-ssh buffer name
      if not host then
        local bufname = vim.api.nvim_buf_get_name(0)
        host = bufname:match("^oil%-ssh://([^/]+)//")
      end

      if not host then
        host = "local"
      end
              
      vim.ui.input({ prompt = host .. ' $ ' }, function(input)
        if input then
          vim.cmd('rightbelow split')
          if host == "local" then
            vim.cmd('terminal ' .. input)
          else
            vim.cmd('terminal ssh -t ' .. host .. ' ' .. input)
          end
          vim.b.ssh_host = host
        end
      end)
    end, { desc = 'Terminal horizontal split' })

    vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { silent = true, noremap = true })

    -- Close terminal buffer with 'q' in normal mode
    vim.api.nvim_create_autocmd('TermOpen', {
      pattern = '*',
      callback = function()
        vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = true, silent = true })
      end,
    })



             
  '';
}
