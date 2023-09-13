return {
  "mhartington/formatter.nvim",
  config = function()
    vim.cmd([[
    augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
    augroup END
    ]])
  end,
  opts = function()
    local util = require("formatter.util")
    return {

      logging = true,
      log_level = vim.log.levels.WARN,
      filetype = {
        typescript = {
          -- require("formatter.filetypes.typescript").prettierd,
          function()
            return {
              exe = "/home/rylan/.local/share/pnpm/prettierd",
              args = { util.escape_path(util.get_current_buffer_file_path()) },
              stdin = true,
            }
          end,
        },
        lua = {
          require("formatter.filetypes.lua").stylua,
        },
      },
    }
  end,
}
