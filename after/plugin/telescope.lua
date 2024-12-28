local builtin = require('telescope.builtin')

-- Setup Telescope with ignore patterns
require('telescope').setup {
    defaults = {
        file_ignore_patterns = {
            "^node_modules",
            "^env",
            "build",
            "dist",
            ".git/",
            "%.lock",
            "__pycache__",
            "%.o", "%.a", "%.out",
            "%.class", "%.jar",
            "%.so", "%.dll", "%.dylib",
            "%.exe", "%.tmp", "%.swp",
            "%.log", "%.DS_Store",
            "coverage/",
            "vendor/",
            "%.svg", "%.png", "%.jpg", "%.jpeg", "%.gif",
            "%.env",
            "terraform.tfstate",
            "frontend/wailsjs/",
            "frontend/src/assets/"
        }
    }
}

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>p', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
