-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.options")
require("utils")

vim.cmd([[
set mousemodel=extend
]])
vim.g.material_style = "deep ocean"
vim.g.material_theme_style = "ocean"

-- vim.o.guifont = "FiraCode Nerd Font:h14"
-- vim.opt.guifont = "FiraCode Nerd Font:h14"
-- vim.g.guifont = "FiraCode Nerd Font:h14"
if vim.g.neovide then
  vim.g.neovide_scale_factor = 1.0
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.25)
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.25)
  end)
end
vim.filetype.add({
  pattern = {
    [".*%.blade%.php"] = "blade",
  },
})
