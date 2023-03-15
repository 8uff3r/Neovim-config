return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function()
    local nls = require("null-ls")
    return {
      sources = {
        nls.builtins.formatting.prettierd.with({
          filetypes = { "vue", "yaml", "jsonc", "graphql", "css", "scss", "less" },
          --   dynamic_command = command_resolver.from_node_modules(),
        }),
        nls.builtins.code_actions.eslint_d.with({
          filetypes = { "vue" },
        }),
        nls.builtins.formatting.shfmt,
        require("typescript.extensions.null-ls.code-actions"),
        nls.builtins.formatting.stylua,
        nls.builtins.diagnostics.flake8,
        nls.builtins.formatting.dprint.with({
          command = "/home/rylan/.dprint/bin/dprint",
          args = function(params)
            return { "fmt", "--stdin", params.bufname }
          end,
        }),
        nls.builtins.formatting.rustywind,
        nls.builtins.code_actions.refactoring,
        -- nls.builtins.diagnostics.golangci_lint,
      },
    }
  end,
}
