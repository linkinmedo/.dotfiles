require 'nvim-tree'.setup {
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable      = true,
    update_cwd  = false,
    ignore_list = {}
  },
  view = {
    mappings = {
      list = {
        { key = "<Tab>", action = "close" },
        { key = "<S-Tab>", action = "preview" },
      },
    },
  },
  actions = {
    open_file = {
      quit_on_open = true
    }
  },
  renderer = {
    highlight_opened_files = "all"
  },
  follow = ture
}

local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
