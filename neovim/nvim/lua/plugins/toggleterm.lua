return {
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        direction = "float",
        float_opts = {
          border = 'single',
          title_pos = 'center',
        },
      })
      vim.keymap.set('n', '<leader>tt', ':ToggleTerm <cr>')
    end,
  },
}
