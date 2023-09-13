-- local toggle_term_cmd = helpers.toggle_term_cmd
-- local python = vim.fn.executable("python") == 1 and "python" or vim.fn.executable("python3") == 1 and "python3"

return {
  {
    "akinsho/toggleterm.nvim",
    lazy = false,
    version = "*",
    keys = {
      { "<leader>ts", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Horizontal terminal" },
      { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Vertical terminal" },
      { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Floating terminal" },
    },
    opts = {
      shell = "/bin/fish",
      close_on_exit = true,
      autochdir = true,
      float_opts = {
        border = curved,
      },
      winbar = {
        enabled = false,
        name_formatter = function(term) --  term: Terminal
          return term.name
        end,
      },
    },
  },
  {
    "https://git.sr.ht/~havi/telescope-toggleterm.nvim",
    dependencies = {
      "akinsho/toggleterm.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function(_, opts)
      require("telescope").load_extension("toggleterm")
      require("telescope-toggleterm").setup({
        telescope_mappings = {
          -- <ctrl-c> : kill the terminal buffer (default) .
          ["<C-c>"] = require("telescope-toggleterm").actions.exit_terminal,
        },
      })
    end,
  },
}
