return {
  "christoomey/vim-tmux-navigator",
  lazy = true,
  config = function()
    vim.cmd([[
    noremap <silent> <m-h> :TmuxNavigateLeft<cr>
    noremap <silent> <m-j> :TmuxNavigateDown<cr>
    noremap <silent> <m-k> :TmuxNavigateUp<cr>
    noremap <silent> <m-l> :TmuxNavigateRight<cr>
    ]])
  end,
}
