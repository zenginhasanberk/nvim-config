-- Importing lsp-zero and setting the recommended preset
local lsp = require("lsp-zero")
lsp.preset("recommended")

-- Setting up Mason and lspconfig with Mason
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "tsserver",  -- For JavaScript and TypeScript
        "eslint",    -- For ESLint
        "pyright",   -- For Python
        "clangd",    -- For C and C++
    }
})

lsp.configure('clangd', {})
lsp.configure('tsserver', {})
lsp.configure('pyright', {})


-- Configuration for nvim-cmp (Completion)
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = {
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<TAB>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
}

-- Removing Tab and Shift-Tab mappings if they are not needed
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

-- Applying cmp mappings
cmp.setup({
    mapping = cmp_mappings
})

-- Setting preferences for lsp-zero
lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

-- On-attach function for additional buffer-local settings
lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    -- Keymap configurations
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

-- Final setup call for lsp-zero
lsp.setup()

-- Diagnostic configuration
vim.diagnostic.config({
    virtual_text = true
})

