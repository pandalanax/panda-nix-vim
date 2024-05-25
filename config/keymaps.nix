{
  keymaps = [
    #keep cursos in middle when searching
    {
      mode = "n";
      key = "n";
      options.silent = true;
      action = "nzzzv";
    }
    {
      mode = "n";
      key = "N";
      options.silent = true;
      action = "nzzzv";
    }

    # insert new line without jumping into insert
    {
      mode = "n";
      key = "<leader>o";
      options.silent = true;
      action = ''o<Esc>0"_D'';
    }
    {
      mode = "n";
      key = "<leader>O";
      options.silent = true;
      action = ''O<Esc>0"_D'';
    }

    # yank to system clipboard
    {
      mode = "n";
      key = "<leader>y";
      options.silent = true;
      action = ''[["+y]]'';
    }
    {
      mode = "v";
      key = "<leader>y";
      options.silent = true;
      action = ''[["+y]]'';
    }
    #half page jump
    {
      mode = "n";
      key = "<C-e>";
      options.silent = true;
      action = ''<C-d>zz'';
    }
    {
      mode = "n";
      key = "<C-i>";
      options.silent = true;
      action = ''<C-u>zz'';
    }

    #move line up with E
    {
      mode = "v";
      key = "E";
      options.silent = true;
      action = '':m '>+1<CR>gv=gv'';
    }
    {
      mode = "v";
      key = "I";
      options.silent = true;
      action = '':m '<-2<CR>gv=gv'';
    }
  ];
}
