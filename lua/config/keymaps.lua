-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Taken from the LazyVim doc
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<leader>fs", "<cmd>w<cr>", { desc = "Save" })

-- ToggleTerm
if Util.has("toggleterm.nvim") then
  local toggle_term_cmd = helpers.toggle_term_cmd

  -- if vim.fn.executable("lazygit") == 1 then
  --   map("n", "<leader>gg", function()
  --     toggle_term_cmd("lazygit")
  --   end, { desc = "ToggleTerm lazygit" })
  --   map("n", "<leader>gg", function()
  --     toggle_term_cmd("lazygit")
  --   end, { desc = "ToggleTerm lazygit" })
  -- end
  if vim.fn.executable("node") == 1 then
    map("n", "<leader>tn", function()
      toggle_term_cmd("node")
    end, { desc = "ToggleTerm node" })
  end
  if vim.fn.executable("gdu") == 1 then
    map("n", "<leader>tu", function()
      toggle_term_cmd("gdu")
    end, { desc = "ToggleTerm gdu" })
  end
  if vim.fn.executable("btm") == 1 then
    map("n", "<leader>tt", function()
      toggle_term_cmd("btm")
    end, { desc = "ToggleTerm btm" })
  end
  local python = vim.fn.executable("python") == 1 and "python" or vim.fn.executable("python3") == 1 and "python3"
  if python then
    map("n", "<leader>tp", function()
      toggle_term_cmd(python)
    end, { desc = "ToggleTerm python" })
  end
  map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "ToggleTerm float" })
  map("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = "ToggleTerm horizontal split" })
  map("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "ToggleTerm vertical split" })
  -- map({ "n", "t" }, { "<F7>", "<C-'>" }, "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
end
