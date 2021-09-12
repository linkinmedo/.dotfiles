-- Ctrl h & l move tabs
vim.api.nvim_set_keymap('n', '<C-l>', 'gt', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', 'gT', { noremap = true })

-- Keep lines selected after indentation
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true })

-- Ctrl+c will copy to clipboard
vim.api.nvim_set_keymap('', '<C-c>', '"+y', {})

-- Ctrl+a to jump to end of line
vim.api.nvim_set_keymap('i', '<C-a>', '<Esc>A', {})

-- Remap j and k to scroll by visual lines
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })

-- Use Tab to toggle tree 
vim.api.nvim_set_keymap('n', '<Tab>', ':NvimTreeToggle<CR>', { noremap = true })

-- Remap Ctrl-p to Telescope find_file 
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope git_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-g>', ':Telescope live_grep<CR>', { noremap = true })
