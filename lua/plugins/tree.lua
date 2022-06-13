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
  actions = {
    open_file = {
      quit_on_open
    }
  },
  renderer = {
    highlight_opened_files = "all"
  },
  follow = ture
}
