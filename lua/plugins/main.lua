return {
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
  {
    "nvim-neorg/neorg",
    -- lazy-load on filetype
    ft = "norg",
    config = true,
  },
  { "nvim-lua/plenary.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "Shatur/neovim-session-manager" },
  { "nvim-telescope/telescope-ui-select.nvim" },
  { "mskelton/live-reload.nvim" },
  { "tiagovla/scope.nvim" },
  { "prettier/vim-prettier" },
  { "kdheepak/lazygit.nvim" },
  {
    "numToStr/Comment.nvim",
    --     keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
    opts = function()
      return { pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook() }
    end,
    config = function()
      require("Comment").setup()
    end,
  },
  { "kdheepak/lazygit.nvim" },
}
