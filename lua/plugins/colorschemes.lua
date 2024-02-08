return {
  {
    "Shatur/neovim-ayu",
    priority = 1000,
    config = function()
      vim.g.ayu_extended_palette = 1
      vim.g.ayu_sign_contrast = 1
      require("ayu").setup({
        mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
        overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
      })

      vim.opt.background = "dark" -- set this to dark or light
    end,
  },
  { "marko-cerovac/material.nvim", priority = 1000, lazy = false },
}
