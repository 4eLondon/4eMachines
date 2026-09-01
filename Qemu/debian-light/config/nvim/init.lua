-- Basic options
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = false
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "@comment", { ctermfg = 8 })
        vim.api.nvim_set_hl(0, "@string", { ctermfg = 2 })
        vim.api.nvim_set_hl(0, "@function", { ctermfg = 4 })
        vim.api.nvim_set_hl(0, "@keyword", { ctermfg = 5 })
        vim.api.nvim_set_hl(0, "@type", { ctermfg = 3 })
        vim.api.nvim_set_hl(0, "@variable", { ctermfg = 7 })
        vim.api.nvim_set_hl(0, "@constant", { ctermfg = 6 })
        vim.api.nvim_set_hl(0, "@number", { ctermfg = 6 })
    end,
})
-- Wrapping
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.textwidth = 0
vim.opt.showbreak = "↪ "
vim.opt.breakindent = true
vim.opt.breakindentopt = "shift:2"
-- Folds
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldenable = false
vim.opt.fillchars = {
    fold = "·",
    foldopen = "▾",
    foldclose = "▸",
    foldsep = "│",
}
-- Transparent background
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    end,
})
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
-- Persistent undo history
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.undolevels = 10000
-- Clipboard
vim.opt.clipboard = "unnamedplus"
-- Restore cursor position on open
vim.api.nvim_create_autocmd("BufReadPost", {
    desc = "Return to last cursor position when reopening a file",
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local line_count = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= line_count then
            vim.api.nvim_win_set_cursor(0, mark)
            vim.cmd("normal! zz")
        end
    end,
})
-- Auto format on save, guarded
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        if #vim.lsp.get_clients({ bufnr = 0 }) > 0 then
            vim.lsp.buf.format({ async = false })
        end
    end,
})

-- Minimal built-in autopairs (no plugin manager, no git dependency)
do
    local pairs_map = {
        ["("] = ")",
        ["["] = "]",
        ["{"] = "}",
        ['"'] = '"',
        ["'"] = "'",
    }
    local closers = { [")"] = true, ["]"] = true, ["}"] = true, ['"'] = true, ["'"] = true }

    for open, close in pairs(pairs_map) do
        vim.keymap.set("i", open, function()
            return open .. close .. "<Left>"
        end, { expr = true })
    end

    for close, _ in pairs(closers) do
        vim.keymap.set("i", close, function()
            local col = vim.fn.col(".")
            local line = vim.fn.getline(".")
            local next_char = line:sub(col, col)
            if next_char == close then
                return "<Right>"
            end
            return close
        end, { expr = true })
    end

    vim.keymap.set("i", "<BS>", function()
        local col = vim.fn.col(".")
        local line = vim.fn.getline(".")
        local prev_char = line:sub(col - 1, col - 1)
        local next_char = line:sub(col, col)
        if pairs_map[prev_char] == next_char then
            return "<BS><Del>"
        end
        return "<BS>"
    end, { expr = true })

    vim.keymap.set("i", "<CR>", function()
        local col = vim.fn.col(".")
        local line = vim.fn.getline(".")
        local prev_char = line:sub(col - 1, col - 1)
        local next_char = line:sub(col, col)
        if pairs_map[prev_char] == next_char then
            return "<CR><Esc>O"
        end
        return "<CR>"
    end, { expr = true })
end

-- Diagnostics
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    float = {
        border = "rounded",
        source = true,
    },
})
-- Keymaps
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("v", "<C-c>", '"+y')
vim.keymap.set("n", "<C-a>", "ggVG")
vim.keymap.set("v", "<C-a>", "<Esc>ggVG")
vim.keymap.set("i", "<C-v>", '<Esc>"+pi')
vim.keymap.set("n", "<C-v>", '"+p')
vim.keymap.set("v", "<C-v>", '"+p')
vim.keymap.set({ "n", "v" }, "<Down>", "gj", { buffer = 0 })
vim.keymap.set({ "n", "v" }, "<Up>", "gk", { buffer = 0 })
