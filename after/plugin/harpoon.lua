local harpoon = require("harpoon")

-- Setup Harpoon
harpoon:setup()

-- Add file to Harpoon
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)

-- Toggle quick menu
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- Navigate to files
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

-- Navigate through list
vim.keymap.set("n", "<leader>[", function() harpoon:list():prev() end)
vim.keymap.set("n", "<leader>]", function() harpoon:list():next() end)

