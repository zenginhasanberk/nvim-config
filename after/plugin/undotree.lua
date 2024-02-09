vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)


-- Increase the number of undo levels
vim.opt.undolevels = 1000 -- set to -1 for unlimited

-- Enable persistent undo
-- vim.opt.undofile = true
-- vim.opt.undodir = vim.fn.stdpath('data') .. '/undo' -- ensure this directory exists
