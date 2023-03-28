return {
  'romgrk/barbar.nvim',
  version = '^1.x',

  config = function()
    require('bufferline').setup({
      -- Auto-hiding the tab bar when there is a single buffer
      auto_hide = true,
    })
  end,
}
