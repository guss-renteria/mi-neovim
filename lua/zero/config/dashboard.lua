local g = vim.g
local fn = vim.fn

if vim.fn.has("win32") == 1 then
  plugins_count = fn.len(fn.globpath("~/AppData/Local/nvim-data/site/pack/packer/start", "*", 0, 1))
else
  plugins_count = fn.len(fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
end

g.dashboard_default_executive = "telescope"
g.dashboard_custom_header = {
  '',
  ' ███▄    █  ██▒   █▓  ██▓ ███▄ ▄███▓',
  ' ██ ▀█   █ ▓██░   █▒▒▓██▒▓██▒▀█▀ ██▒',
  '▓██  ▀█ ██▒ ▓██  █▒░▒▒██▒▓██    ▓██░',
  '▓██▒  ▐▌██▒  ▒██ █░░░░██░▒██    ▒██ ',
  '▒██░   ▓██░   ▒▀█░  ░░██░▒██▒   ░██▒',
  '░ ▒░   ▒ ▒    ░ ▐░   ░▓  ░ ▒░   ░  ░',
  '░ ░░   ░ ▒░   ░ ░░  ░ ▒ ░░  ░      ░',
  '   ░   ░ ░       ░  ░ ▒ ░░      ░   ',
  '         ░       ░    ░         ░   ',
  '',
}
g.indentLine_fileTypeExclude = {'dashboard'}
g.dashboard_custom_section = {
  a = { description = { "☘  > Tree                      SPC n t" }, command = "NvimTreeToggle" },
  b = { description = { "  > Load Last Session         SPC s l" }, command = "SessionLoad" },
  c = { description = { "  > Find File                 SPC f f" }, command = "Telescope find_files" },
  d = { description = { "  > New File                  SPC t  " }, command = "tabe" },
}
g.dashboard_custom_footer = {
  "NVIM Loaded " .. plugins_count .. " plugins!  ",
  "user: guss-renteria",
}

vim.cmd("hi! dashboardHeader   guifg=White")
vim.cmd("hi! dashboardCenter   guifg=White gui='bold'")
vim.cmd("hi! dashboardShortcut guifg=#ea6a80 gui='bold'")
vim.cmd("hi! dashboardFooter   guifg=White")
