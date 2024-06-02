function ColorMyPencils(color)
    color = color or "gruvbox"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "NonText", { bg = "none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none", ctermbg = "none" })
  
    -- Set the background image
    vim.cmd([[
      augroup MyBackground
        autocmd!
        autocmd VimEnter * :silent exec "!nitrogen --set-scaled ~/.config/nvim/background.jpg"
      augroup END
    ]])
  end

  ColorMyPencils()
