local ayu_dark = require("lualine.themes.ayu_dark")
return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = { theme = ayu_dark },
    })
  end,
}
