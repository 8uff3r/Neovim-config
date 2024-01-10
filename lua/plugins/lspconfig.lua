-- add tsserver and setup with typescript.nvim instead of lspconfig
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "onsails/lspkind.nvim",
    },
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- change a keymap
      keys[#keys + 1] = { "K", "<cmd>Lspsaga hover_doc<CR>" }
      keys[#keys + 1] = { "<leader>ca", false, mode = { "n", "v" } }
      keys[#keys + 1] = { "<leader>cA", false }
      keys[#keys + 1] = { "<leader>cr", false }
      keys[#keys + 1] = { "<Space>ca", false, mode = { "n", "v" } }
      keys[#keys + 1] = { "<Space>cA", false }
      keys[#keys + 1] = { "<Space>cr", false }
      require("lazyvim.util").lsp.on_attach(function(_, buffer) end)
    end,
    opts = function()
      local util = require("lspconfig.util")
      local function get_typescript_server_path(root_dir)
        local global_ts = "/home/rylan/.local/share/pnpm/global/5/node_modules/typescript/lib/"
        -- Alternative location if installed as root:
        -- local global_ts = '/usr/local/lib/node_modules/typescript/lib'
        local found_ts = ""
        local function check_dir(path)
          found_ts = util.path.join(path, "node_modules", "typescript", "lib")
          if util.path.exists(found_ts) then
            return path
          end
        end
        if util.search_ancestors(root_dir, check_dir) then
          return found_ts
        else
          return global_ts
        end
      end
      return {
        -- options for vim.diagnostic.config()
        on_new_config = function(new_config, new_root_dir)
          new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
        end,
        inlay_hints = { enabled = true },
        diagnostics = {
          underline = true,
          update_in_insert = false,
          virtual_text = { spacing = 4, prefix = "●" },
          severity_sort = true,
        },
        -- Automatically format on save
        -- autoformat = true,
        -- options for vim.lsp.buf.format
        -- `bufnr` and `filter` is handled by the LazyVim formatter,
        -- but can be also overridden when specified

        -- Never request volar for formatting, because of wrong postcss formatting
        format = {
          filter = function(client)
            return client.name ~= "volar"
          end,
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
          gopls = {
            settings = {
              gopls = {
                codelenses = {
                  gc_details = true,
                  tidy = true,
                  test = true,
                  run_govulncheck = true,
                  upgrade_dependency = true,
                },
                analyses = {
                  fieldalignment = true,
                  shadow = true,
                },
                hints = {
                  compositeLiteralTypes = true,
                  constantValues = true,
                  parameterNames = true,
                  rangeVariableTypes = true,
                },
              },
            },
          },
          rust_analyzer = {},
          csharp_ls = {},
          nim_langserver = {},
          -- tsserver = {},
          lua_ls = {
            autostart = false,
          },
          julials = {},
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
      }
    end,
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
