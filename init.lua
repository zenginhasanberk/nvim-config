require("hbzengin")
vim.cmd("set colorcolumn=")
vim.cmd("set title")

-- Below because I make the typo :W a lot.
vim.api.nvim_create_user_command(
    'W',
    'w',
    {}
)

-- Don't continue comment after going to next line on a commented line

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ "r", "o" })
    end,
})

vim.cmd([[
  highlight Normal guibg=none ctermbg=none
  highlight NonText guibg=none ctermbg=none
]])
