-- add tsserver and setup with typescript.nvim instead of lspconfig
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "onsails/lspkind.nvim",
    },
    init = function()
      -- require("lspconfig").volar.setup({
      --   filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
      --   cmd = { "/home/rylan/.local/share/pnpm/vue-language-server", "--stdio" },
      -- })
      -- require("lspconfig").gopls.setup({})
      require("lazyvim.util").on_attach(function(_, buffer)
      -- stylua: ignore
      vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
        vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
      end)
    end,
    -- @class PluginLspOpts
    -- function()
    -- return
    opts = {
      -- options for vim.diagnostic.config()
      inlay_hints = { enabled = true },
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      },
      -- Automatically format on save
      autoformat = true,
      -- options for vim.lsp.buf.format
      -- `bufnr` and `filter` is handled by the LazyVim formatter,
      -- but can be also overridden when specified
      format = {
        formatting_options = nil,
        timeout_ms = 10000,
      },
      ---@type lspconfig.options
      servers = {
        volar = {
          init_options = {
            typescript = {
              tsdk = "/home/rylan/.local/share/pnpm/global/5/node_modules/typescript/lib/",
            },
          },
          settings = {
            vue = {
              autoInsert = {
                bracketSpacing = true,
                dotValue = true,
              },
              inlayHints = {
                inlineHandlerLeading = true,
                missingProps = true,
                optionsWrapper = true,
              },
            },
            typescript = {
              tsdk = "/home/rylan/.local/share/pnpm/global/5/node_modules/typescript/lib/",
              updateImportsOnFileMove = {
                enabled = "always",
              },
              preferences = {
                quoteStyle = "double",
                importModuleSpecifier = "relative",
              },
              autoClosingTags = true,
              referencesCodeLens = {
                enabled = true,
                showOnAllFunctions = true,
              },
              implementationsCodeLens = true,
              inlayHints = {
                variableTypes = { enabled = false },
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = {
                  enabled = "all",
                  suppressWhenArgumentMatchesName = false,
                },
                parameterTypes = {
                  enabled = true,
                  suppressWhenTypeMatchesName = false,
                },
                propertyDeclarationTypes = { enabled = true },
              },
            },
          },
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
          -- filetypes = { "vue", "json" },
          cmd = { "/home/rylan/.local/share/pnpm/vue-language-server", "--stdio" },
        },
        gopls = {},
        rust_analyzer = {},
        csharp_ls = {},
        nim_langserver = {},
        -- tsserver = {},
        lua_ls = {
          autostart = false,
        },
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- lua_ls = function(_, _)
        --   return true
        -- end,
        -- example to setup with typescript.nvim
        tsserver = function(_, opts)
          return true
        end,
        -- volar = function(server, opts)
        --   require("typescript").setup({ server = opts })
        --   -- return true
        -- end,

        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts)
        -- end,
      },
    },
    -- end,
  },
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --   opts = {},
  -- },
  { "alaviss/nim.nvim" },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {
      -- options
    },
  },
}
