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
        component_separators = '|',
        disabled_filetypes = {
        statusline = {
          'neo-tree',
          'lazy',
          'dashboard',
          'alpha',
        }
       }
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
