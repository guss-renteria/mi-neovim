local g = vim.g
vim.opt.list = true

g.indent_blankline_char = '┋'
g.indent_blankline_context_char = '┋'
g.indent_blankline_use_treesitter = true

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
}
vim.cmd [[highlight IndentBlanklineChar guifg=#505050]]
vim.cmd [[highlight IndentBlanklineContextChar guifg=#e0e0e0 gui='bold']]
