return {
  "glepnir/lspsaga.nvim",
  event = "BufRead",
  opts = {
    lightbulb = {
      enable = true,
      enable_in_insert = true,
      sign = true,
      sign_priority = 40,
      virtual_text = true,
    },
    ui = {
      -- Currently, only the round theme exists
      theme = "round",
      -- This option only works in Neovim 0.9
      title = true,
      -- Border type can be single, double, rounded, solid, shadow.
      border = "solid",
      winblend = 0,
      expand = "",
      collapse = "",
      preview = " ",
      code_action = "💡",
      diagnostic = "🐞",
      incoming = " ",
      outgoing = " ",
      hover = " ",
      kind = {},
    },
  },
  config = function()
    require("lspsaga").setup({})
  end,
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    --Please make sure you install markdown and markdown_inline parser
    { "nvim-treesitter/nvim-treesitter" },
    { "neovim/nvim-lspconfig" },
    -- { "VonHeikemen/lsp-zero.nvim" }
  },
}