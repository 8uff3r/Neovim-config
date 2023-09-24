local ayu_dark = require("lualine.themes.ayu_dark")
return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = { theme = ayu_dark },
      sections = {
        lualine_c = {
          "filename",
          -- {
          --   require("noice").api.status.mode.get,
          --   cond = require("noice").api.status.mode.has,
          --   color = { fg = "#ff9e64" },
          -- },
          {
            require("noice").api.status.search.get,
            cond = require("noice").api.status.search.has,
            color = { fg = "#ff9e64" },
          },
          {
            require("recorder").displaySlots,
          },
          {
            require("recorder").recordingStatus,
          },
        },
      },
    })
  end,
}
