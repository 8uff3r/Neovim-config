-- add tsserver and setup with typescript.nvim instead of lspconfig
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "jose-elias-alvarez/typescript.nvim",
    init = function()
      -- require("lspconfig").volar.setup({
      --   filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
      --   cmd = { "/home/rylan/.local/share/pnpm/vue-language-server", "--stdio" },
      -- })
      -- require("lspconfig").gopls.setup({})
      require("lazyvim.util").on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
        vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
      end)
    end,
  },
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      -- tsserver will be automatically installed with mason and loaded with lspconfig
      tsserver = {
        filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
      },
      volar = {
        filetypes = { "vue", "json" },
        cmd = { "/home/rylan/.local/share/pnpm/vue-language-server", "--stdio" },
      },
      gopls = {},
      lua_ls = {},
    },
    -- you can do any additional lsp server setup here
    -- return true if you don't want this server to be setup with lspconfig
    ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
    setup = {
      -- example to setup with typescript.nvim
      tsserver = function(_, opts)
        require("typescript").setup({ server = opts })
        return true
      end,
      -- Specify * to use this function as a fallback for any server
      -- ["*"] = function(server, opts) end,
    },
  },
}
