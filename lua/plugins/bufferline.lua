return {
  "akinsho/bufferline.nvim",
  version = "v3.*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        separator_style = "padded_slant",
        numbers = "ordinal",
      },
    })
  end,
}
