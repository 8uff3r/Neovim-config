return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    opts = {
      style = "night",
      on_colors = function(c)
        c.bg = "#0E0B13"
        c.bg_sidebar = "#0E0B13"
        c.bg_float = "#0E0B13"
      end,
    },
  },
  {
    "Shatur/neovim-ayu",
    priority = 1000,
    lazy = false,
    config = function()
      vim.g.ayu_extended_palette = 1
      vim.g.ayu_sign_contrast = 1
      require("ayu").setup({
        mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
        overrides = {
          Normal = {
            bg = "#0E0B13",
          },
          Pmenu = {
            bg = "#0E0B13",
          },
          NormalFloat = {
            bg = "#0E0B13",
          },
        }, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
      })

      vim.opt.background = "dark" -- set this to dark or light
    end,
  },
  { "marko-cerovac/material.nvim", priority = 1000, lazy = false, enabled = false },
  {
    "oxfist/night-owl.nvim",
    enabled = false,
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      -- vim.cmd.colorscheme("night-owl")
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    enabled = false,
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
      styles = {
        transparency = true,
      },
      highlight_groups = {
        Keyword = { fg = "orange" },
        Normal = {
          bg = "#0E0B13",
          -- fg = "#0F1419",
        },
      },
    },
  },
  { "EdenEast/nightfox.nvim" },
}
