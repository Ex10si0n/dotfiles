return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = true,
  keys = {
    { '<A-F12>', '<cmd>ToggleTerm<cr>', desc = 'Toggle Terminal' },
  },
  opts = {
    open_mapping = [[<A-F12>]],
    direction = 'horizontal',
    size = 15,
  },
}
