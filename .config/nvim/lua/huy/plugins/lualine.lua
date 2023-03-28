return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  priority = 1000,

  config = function()
    require('lualine').setup({
      -- Lualine Detail
      options = {
       theme = require('lualine.themes.moonfly'),
       section_separators = '',
       component_separators = '',
      },

      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'filename' },
        lualine_x = {},
        lualine_y = { 'filetype' },
        lualine_z = { 'location' },
      },    
    })
  end,
}
