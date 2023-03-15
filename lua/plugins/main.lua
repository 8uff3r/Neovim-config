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

  {
    "Equilibris/nx.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("nx").setup({})
    end,
  },
  {
    "tiagovla/scope.nvim",
    config = function()
      require("scope").setup()
    end,
    -- keys = {
    --   { "<A-l>", "<cmd>tabnext<cr>", { desc = "tabnext" } },
    --   { "<A-h>", "<cmd>tabprevious<cr>", { desc = "tabprev" } },
    --   { "<A-t>", "<cmd>tabnew<cr>", { desc = "tabnew" } },
    --   { "<A-c>", "<cmd>tabclose<cr>", { desc = "tabclose" } },
    -- },
  },
  -- { "prettier/vim-prettier" },
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
    enabled = false,
    opts = {
      max_height = function()
        return math.floor(vim.o.lines * 0.8)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.1)
      end,
    },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  { "nvim-telescope/telescope-ui-select.nvim" },
  -- { "windwp/nvim-ts-autotag",
  --   config = function()
  --     require('nvim-ts-autotag').setup()
  --   end },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        "css",
        "javascript",
      })
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },
  { "sindrets/diffview.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  {
    "olivercederborg/poimandres.nvim",
    config = function()
      require("poimandres").setup({
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
      })
    end,
  },
  { "marko-cerovac/material.nvim" },
  { "catppuccin/nvim" },
  -- {
  --   "ray-x/go.nvim",
  --   dependencies = { -- optional packages
  --     "ray-x/guihua.lua",
  --     "neovim/nvim-lspconfig",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   config = function()
  --     require("go").setup()
  --   end,
  --   event = { "CmdlineEnter" },
  --   ft = { "go", "gomod" },
  --   build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  -- },
}
