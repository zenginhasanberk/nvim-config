vim.g.mapleader = " "

vim.o.clipboard = "unnamedplus"

-- Horizontal split
vim.api.nvim_set_keymap('n', '<leader>hs', ':split<CR>', { noremap = true, silent = true })

-- Remap Cmd + u to redo (Ctrl + r)
vim.api.nvim_set_keymap('n', '<D-u>', '<C-r>', { noremap = true, silent = true })

-- Map U to u: U does the same thing only for one step
vim.api.nvim_set_keymap('n', 'U', 'u', { noremap = true, silent = true })

-- Easy window navigation with Command + Control
vim.api.nvim_set_keymap('n', '<A-Left>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-Down>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-Up>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-Right>', '<C-w>l', { noremap = true })

-- Easy window navigation with Command + Control
vim.api.nvim_set_keymap('n', '<A-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-l>', '<C-w>l', { noremap = true })

-- Consistency with kitty
vim.api.nvim_set_keymap('n', '<leader>[', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>]', '<C-w>l', { noremap = true })

-- Meta (Option) keys for OSX
vim.api.nvim_set_keymap('n', '<M-[>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-]>', '<C-w>l', { noremap = true })

-- Same but using hjkl for easier navigation with Command + Control
vim.api.nvim_set_keymap('n', '<leader>h', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>j', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>k', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>l', '<C-w>l', { noremap = true })

-- Go back to wherever you were
vim.keymap.set('n', 'dg', '<C-O>', { noremap = true })

-- The Primeagen remaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- vim.keymap.set("n", "\\", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
-- vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
-- vim.keymap.set({"n", "v"}, "<leader>y", [["*y]])
-- vim.keymap.set("n", "<leader>Y", [["*y]])
vim.keymap.set("n", "<leader>Y", [["*y]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["*y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
-- vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set('n', '<leader>t', '<cmd>Neotree<CR>', { noremap = true, silent = true })
