return {
'sudormrfbin/cheatsheet.nvim',

  dependencies = {
    {'nvim-telescope/telescope.nvim'},
    {'nvim-lua/popup.nvim'},
    {'nvim-lua/plenary.nvim'},
  },
  config = function ()
    vim.keymap.set('n', '<leader>cs', ':Cheatsheet <CR>')
  end
}
