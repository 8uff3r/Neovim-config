return {

  "gbprod/phpactor.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim", -- required to update phpactor
    "neovim/nvim-lspconfig", -- required to automaticly register lsp serveur
  },
  config = function()
    require("phpactor").setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      install = {
        bin = "/home/rylan/.local/share/nvim/mason/packages/phpactor/bin/phpactor",
      },
    })
    require("lspconfig").phpactor.setup({
      on_attach = on_attach,
      init_options = {
        ["language_server_phpstan.enabled"] = true,
        ["language_server_psalm.enabled"] = false,
      },
    })
  end,
}
