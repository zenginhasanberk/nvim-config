-- Function to escape terminal mode and navigate
local function term_nav(key, command)
    vim.api.nvim_set_keymap('t', key, '<C-\\><C-n>' .. command, { noremap = true })
end

-- Setting up the terminal mode navigation mappings for hjkl
-- term_nav('<Leader>h', '<C-w>h')
-- term_nav('<Leader>j', '<C-w>j')
-- term_nav('<Leader>k', '<C-w>k')
-- term_nav('<Leader>l', '<C-w>l')

-- Adding arrow keys mappings
term_nav('<Leader><Left>', '<C-w>h')
term_nav('<Leader><Down>', '<C-w>j')
term_nav('<Leader><Up>', '<C-w>k')
term_nav('<Leader><Right>', '<C-w>l')

-- require("toggleterm").setup {
--     size = 15,
--     open_mapping = [[<c-x>]],
--     hide_numbers = true,
--     shade_filetypes = {},
--     shading_factor = -3,
--     start_in_insert = true,
--     terminal_mappings = true,
--     direction = 'horizontal',
--     close_on_exit = true,
--     shell = vim.o.shell,
--     float_opts = {
--         border = 'curved',
--         winblend = 3,
--     },
-- }
