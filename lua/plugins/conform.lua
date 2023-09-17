return {
  "stevearc/conform.nvim",
  opts = function()
    return {
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 10500,
        lsp_fallback = true,
      },
      -- Map of filetype to formatters
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "dprint", "prettierd", "prettier" } },
        typescript = { { "dprint", "prettierd", "prettier" } },
        json = { { "dprint", "prettierd", "prettier" } },
        vue = { { "prettierd", "prettier" }, "rustywind" },
        svelte = { { "prettierd", "prettier" }, "rustywind" },
        yaml = { { "prettierd", "prettier" } },
        css = { { "prettierd", "prettier" } },
        scss = { { "prettierd", "prettier" } },
        -- Use the "*" filetype to run formatters on all files.
        -- Note that if you use this, you may want to set lsp_fallback = "always"
        -- (see :help conform.format)
        ["*"] = { "trim_whitespace" },
      },
      formatters = {
        rustywind = {
          command = "rustywind",
          args = { "--stdin" },
          stdin = true,
        },
        dprint = {
          command = "/home/rylan/.dprint/bin/dprint",
          args = { "fmt", "--stdin", "$FILENAME" },
          stdin = true,
          cwd = require("conform.util").root_file({ "dprint.json" }),
        },
      },
    }
  end,
}
