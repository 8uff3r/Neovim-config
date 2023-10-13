return {
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  { "folke/neodev.nvim", lazy = true },
  { "nvim-lua/plenary.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "Shatur/neovim-session-manager" },
  {
    "tiagovla/scope.nvim",
    config = function()
      require("scope").setup()
    end,
    keys = {
      { "<A-l>", "<cmd>tabnext<cr>", { desc = "tabnext" } },
      { "<A-h>", "<cmd>tabprevious<cr>", { desc = "tabprev" } },
      { "<A-t>", "<cmd>tabnew<cr>", { desc = "tabnew" } },
      { "<A-c>", "<cmd>tabclose<cr>", { desc = "tabclose" } },
    },
  },
  {
    "numToStr/Comment.nvim",
    keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
    opts = function()
      return { pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook() }
    end,
    config = function()
      local ft = require("Comment.ft")
      ft.csharp = { "//%s", "/* %s */" }
      require("Comment").setup()
    end,
  },
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
    "norcalli/nvim-colorizer.lua",
    lazy = true,
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
  { "sindrets/diffview.nvim", dependencies = { "nvim-lua/plenary.nvim" }, lazy = true },
  {
    "HiPhish/nvim-ts-rainbow2",
    config = function()
      require("nvim-treesitter.configs").setup({
        rainbow = {
          enable = true,
          -- list of languages you want to disable the plugin for
          disable = {},
          -- Which query to use for finding delimiters
          query = "rainbow-parens",
          -- Highlight the entire buffer all at once
          strategy = require("ts-rainbow").strategy.global,
        },
      })
    end,
  },
  {
    "ray-x/go.nvim",
    lazy = true,
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" }, lazy = true },
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
      require("flutter-tools").setup({})
    end,
  },
  {
    "mustache/vim-mustache-handlebars",
  },
  { "https://github.com/nikvdp/neomux" },
  {
    "acksld/nvim-neoclip.lua",
    keys = {
      { "<leader>y", "<cmd>Telescope neoclip<cr>" },
    },
    opts = {
      enable_persistent_history = true,
    },
  },
  {
    "ecthelionvi/NeoComposer.nvim",
    enabled = false,
    dependencies = { "kkharji/sqlite.lua" },
    opts = {},
  },
  {
    "smjonas/live-command.nvim",
    -- live-command supports semantic versioning via tags
    -- tag = "1.*",
    config = function()
      require("live-command").setup({
        commands = {
          Norm = { cmd = "norm" },
        },
      })
    end,
  },
  {
    "chrisgrieser/nvim-recorder",
    dependencies = "rcarriga/nvim-notify", -- optional
    opts = {}, -- required even with default settings, since it calls `setup()`
  },
  {

    "echasnovski/mini.hipatterns",
    opts = {
      tailwind = {

        ft = { "typescriptreact", "javascriptreact", "css", "javascript", "typescript", "html", "vue", "svelte" },
      },
    },
  },
}
