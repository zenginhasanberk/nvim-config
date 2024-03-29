-- require'nvim-tree'.setup {
--   -- Enables the Git integration
--   git = {
--     enable = true,
--   },
--
--     filters = {
--         dotfiles = true,
--         -- git_clean = false,
--         -- no_buffer = false,
--         -- custom = { },
--     },
--
--   -- Removes the default statusline
--   disable_netrw = true,
--   hijack_netrw = true,
--   
--   -- Update the tree when changing files
--   update_cwd = true,
--
--   -- Show lsp diagnostics in the signcolumn
--   diagnostics = {
--     enable = true,
--     icons = {
--       hint = "H",
--       info = "I",
--       warning = "W",
--       error = "E",
--     },
--   },
-- }
--
-- local function open_nvim_tree()
--
--   -- open the tree
--   require("nvim-tree.api").tree.open()
-- end
--
-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
--
-- -- -- auto close
-- -- local function is_modified_buffer_open(buffers)
-- --     for _, v in pairs(buffers) do
-- --         if v.name:match("NvimTree_") == nil then
-- --             return true
-- --         end
-- --     end
-- --     return false
-- -- end
--
-- -- vim.api.nvim_create_autocmd("BufEnter", {
-- --     nested = true,
-- --     callback = function()
-- --         if
-- --             #vim.api.nvim_list_wins() == 1
-- --             and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil
-- --             and is_modified_buffer_open(vim.fn.getbufinfo({ bufmodified = 1 })) == false
-- --         then
-- --             vim.cmd("quit")
-- --         end
-- --     end,
-- -- })
--
-- -- To expand the directory on start
-- -- vim.api.nvim_input('E')
