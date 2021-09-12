vim.o.termguicolors = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.number = true
vim.wo.relativenumber = true

-- indentation size and expand tabs
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.expandtab = true
vim.bo.autoindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.autoindent = true

-- indentation guides settings
vim.g.indent_blankline_char_list = {'▏', '|', '¦', '┆', '┊'}
vim.g.indent_blankline_char_highlight = '|'
vim.g.indent_blankline_space_char = '.'
vim.g.indent_blankline_space_char_highlight = '|'
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_debug = true

-- undo settings
vim.bo.undofile = true -- activate presistent undo
vim.g.undodir = '~/.vim/undodir' -- set the undo history save location
vim.bo.undolevels = 1000 -- maximum number of changes that can be undone
vim.g.undoreload = 10000 -- maximum number lines to save for undo on a buffer reload

-- kommentary
vim.api.nvim_set_keymap("n", "//", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("n", "gc", "<Plug>kommentary_motion_default", {})
vim.api.nvim_set_keymap("v", "//", "<Plug>kommentary_visual_default<C-c>", {})

-- set colorscheme
vim.cmd[[colorscheme dracula]]

-- activate inline color of color code
require 'colorizer'.setup({
  '*',
  }, { css = true; })
