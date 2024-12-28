-- Importing lsp-zero and setting the recommended preset
local lsp = require("lsp-zero")
lsp.preset("recommended")

-- Setting up Mason and lspconfig with Mason
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "ts_ls",   -- For JavaScript and TypeScript
        "eslint",  -- For ESLint
        "pyright", -- For Python
        "clangd",  -- For C and C++
        "lua_ls",  -- For Lua
        "gopls"    -- For golang
    }
})

lsp.configure('clangd', {
    cmd = {
        "clangd",
        "--header-insertion=never",
        "--completion-style=bundled",
        "--limit-results=10",
        "--all-scopes-completion=false"
    },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = require('lspconfig').util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
    settings = {
        clangd = {
            compilationDatabaseDirectory = "",
            args = {
                "-Wall", "-Wextra", "-std=c++17", "--", "--remove", "-W*"
            },
            index = {
                background = "Build"
            },
            completion = {
                allScopesCompletion = true
            },
            inlayHints = {
                enabled = true,
                parameterNames = true,
                deducedTypes = true
            },
            hover = {
                showAKA = true
            }
        }
    }
})
lsp.configure('ts_ls', {})
lsp.configure('pyright', {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off"
            }
        }
    }
})


-- Configuration for lua_ls (Lua language server)
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT', -- Use LuaJIT for Neovim
            },
            diagnostics = {
                globals = { 'vim' }, -- Recognize the `vim` global
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true), -- Make the server aware of Neovim runtime files
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
    on_attach = function(client)
        if client.server_capabilities.documentFormattingProvider then
            vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = true })")
        end
    end,
})

lsp.configure('gopls', {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = require('lspconfig').util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
})

-- Configuration for nvim-cmp (Completion)
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = {
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
}

-- Removing Tab and Shift-Tab mappings if they are not needed
-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil

-- Applying cmp mappings
cmp.setup({
    mapping = cmp_mappings,
    sources = {
        { name = 'nvim_lsp', max_item_count = 10 },
        { name = 'buffer',   max_item_count = 5 },
        { name = 'path',     max_item_count = 5 },
    },
    completion = {
        keyword_length = 1, -- start completion after 3 characters
    },
    matching = {
        disallow_fuzzy_matching = true,
        disallow_partial_matching = true,
        disallow_prefix_unmatching = true,
    },
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

-- Keymap
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { noremap = true, silent = true })
