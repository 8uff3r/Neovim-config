-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("utils")
vim.cmd([[
set mousemodel=extend
]])
vim.g.material_style = "deep ocean"
vim.g.material_theme_style = "ocean"
vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#626A95" })
vim.cmd([[
set keywordprg=:Lspsaga\ hover_doc<CR>
]])
