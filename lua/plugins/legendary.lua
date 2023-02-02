return {
  "mrjones2014/legendary.nvim",
  -- sqlite is only needed if you want to use frecency sorting
  dependencies = { "kkharji/sqlite.lua", "folke/which-key.nvim" },
  config = function()
    require("legendary").setup({
      keymaps = {
        -- map keys to a commands
        { "<leader>l", ":Legendary<CR>", description = "Swap current with next" },
      },
      which_key = { auto_register = true },
    })
  end,
}
