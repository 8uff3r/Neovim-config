return {
  "onsails/lspkind.nvim",
  lazy = true,
  config = function()
    require("lspkind").init({
      -- defines how annotations are shown
      -- default: symbol
      -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
      mode = "symbol",
      -- default symbol map
      -- can be either 'default' (requires nerd-fonts font) or
      -- 'codicons' for codicon preset (requires vscode-codicons font)
      --
      -- default: 'default'
      preset = "default",
      -- override preset symbols
      symbol_map = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "ﰠ",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = "",
      },
    })
  end,
}
