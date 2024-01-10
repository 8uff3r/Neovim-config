return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
      { "<leader>.", "<cmd>Telescope file_browser<cr>", desc = "Browse current directory" },
      { "<leader>h", "<cmd>Telescope file_browser path=~/<cr>", desc = "Browse $Home directory" },
      { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Projects" },
      { "<A-x>", "<cmd>Telescope commands<cr>", desc = "Commands" },
    },
    config = function()
      -- This is your opts table
      --
      local actions = require("telescope.actions")
      require("telescope").setup({
        pickers = {
          buffers = {
            mappings = {
              n = {
                ["d"] = "delete_buffer",
              },
              i = {
                ["<C-S-d>"] = "delete_buffer",
              },
            },
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- even more opts
            }),
            file_browser = {
              theme = "ivy",
              hijack_netrw = true,
            },
            -- pseudo code / specification for writing custom displays, like the one
            -- for "codeactions"
            -- specific_opts = {
            --   [kind] = {
            --     make_indexed = function(items) -> indexed_items, width,
            --     make_displayer = function(widths) -> displayer
            --     make_display = function(displayer) -> function(e)
            --     make_ordinal = function(e) -> string
            --   },
            --   -- for example to disable the custom builtin "codeactions" display
            --      do the following
            --   codeactions = false,
            -- }
          },
        },
      })
      -- To get ui-select loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("projects")
      require("telescope").load_extension("file_browser")
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
  },
  { "nvim-telescope/telescope-ui-select.nvim", dependencies = { "nvim-telescope/telescope.nvim" } },
}
