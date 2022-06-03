require'nvim-tree'.setup {
  auto_reload_on_write = true,

  view = {
    side = 'left',
    auto_resize = true,
  },

  actions = {
    open_file = {
      resize_window = true,
    },
  },
}
