return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  --   keys = {
  --     { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
  --     { "<leader>o", "<cmd>Neotree focus<cr>", desc = "Focus Explorer" },
  --   },
  -- config = function()
  --   -- Unless you are still migrating, remove the deprecated commands from v1.x
  --   vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
  --
  --   -- If you want icons for diagnostic errors, you'll need to define them somewhere:
  --   vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
  --   vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
  --   vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
  --   vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
  --   -- NOTE: this is changed from v1.x, which used the old style of highlight groups
  --   -- in the form "LspDiagnosticsSignWarning"
  --
  --   require("neo-tree").setup({
  --     close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
  --     popup_border_style = "rounded",
  --     enable_git_status = true,
  --     enable_diagnostics = true,
  --     sort_case_insensitive = false, -- used when sorting files and directories in the tree
  --   })
  -- end,
  opts = {

    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    modified = {
      symbol = "[+]",
      highlight = "NeoTreeModified",
    },
    name = {
      trailing_slash = false,
      use_git_status_colors = true,
      highlight = "NeoTreeFileName",
    },
    window = {
      position = "left",
      width = 20,
      mapping_options = {
        noremap = true,
        nowait = true,
      },
    },
    filesystem = {
      follow_current_file = true,
      group_empty_dirs = true,
    },
  },
}
