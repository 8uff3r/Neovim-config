return {
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  { "folke/neodev.nvim" },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    run = ":Neorg sync-parsers",
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
        },
      })
    end,
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.norg.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/notes",
            },
          },
        },
      },
    },
    dependencies = { { "nvim-lua/plenary.nvim" } },
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
  { "mrjones2014/smart-splits.nvim" },
  {
    "rcarriga/nvim-notify",
    opts = {
      max_height = function()
        return math.floor(vim.o.lines * 0.15)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.15)
      end,
    },
  },
  -- { "ggandor/leap.nvim", enabled = false },
}
