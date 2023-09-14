return {
  "jose-elias-alvarez/null-ls.nvim",
  enabled = false,
  opts = function()
    local nls = require("null-ls")
    vim.lsp.buf.format({ timeout_ms = 10000 })
    return {
      sources = {
        nls.builtins.formatting.prettierd.with({
          command = "/home/rylan/.local/share/pnpm/prettierd",
          filetypes = { "vue", "yaml", "jsonc", "graphql", "css", "scss", "less" },
          --   dynamic_command = command_resolver.from_node_modules(),
        }),

        nls.builtins.code_actions.eslint_d.with({
          filetypes = { "javascript", "javascriptreact", "vue" },
        }),
        -- nls.builtins.diagnostics.eslint_d.with({
        --   filetypes = { "javascript", "javascriptreact", "vue" },
        -- }),
        nls.builtins.formatting.shfmt,
        nls.builtins.formatting.stylua,
        nls.builtins.diagnostics.flake8,
        nls.builtins.formatting.dprint.with({
          command = "/home/rylan/.dprint/bin/dprint",
          args = function(params)
            return { "fmt", "--stdin", params.bufname }
          end,
        }),
        nls.builtins.formatting.rustywind,
        -- nls.builtins.code_actions.refactoring,
        nls.builtins.diagnostics.golangci_lint,
      },
    }
  end,
}
