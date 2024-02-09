-- Function to escape terminal mode and navigate
local function term_nav(key, command)
    vim.api.nvim_set_keymap('t', key, '<C-\\><C-n>'..command, {noremap = true})
end

-- Setting up the terminal mode navigation mappings for hjkl
term_nav('<C-S-h>', '<C-w>h')
term_nav('<C-S-j>', '<C-w>j')
term_nav('<C-S-k>', '<C-w>k')
term_nav('<C-S-l>', '<C-w>l')

-- Adding arrow keys mappings
term_nav('<C-S-Left>', '<C-w>h')
term_nav('<C-S-Down>', '<C-w>j')
term_nav('<C-S-Up>', '<C-w>k')
term_nav('<C-S-Right>', '<C-w>l')

require("toggleterm").setup{
  size = 15,
  open_mapping = [[<c-x>]],
  hide_numbers = true,
  shade_filetypes = {},
  shading_factor = -3,
  start_in_insert = true,
  terminal_mappings = true,
  direction = 'horizontal',
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = 'curved',
    winblend = 3,
  },
}
