require("hbzengin")
vim.cmd("set colorcolumn=")
vim.cmd("set title")
-- Below because I make the typo :W a lot.
vim.api.nvim_create_user_command(
  'W', 
  'w',
  {}
)
