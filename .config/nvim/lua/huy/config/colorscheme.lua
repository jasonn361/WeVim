return {
  'folke/tokyonight.nvim',
  lazy = false,      -- make sure to load this duing startup if it is your main colorscheme
  priority = 1000,   -- make sure to load this before all the other start plugins
  
  config = function()
    require('tokyonight').setup({

      -- theme style
      style = 'moon',

      -- enable bg transparency
      transparent = true,

      -- content styling
      styles = {
        comments = { italic = true },
        keywords = { italic = false },
        sidebars = 'dark',
        floats = 'dark',
      },

      -- etc
      dim_inactive = false,
      lualine_bold = true,
    })
    -- load the colorscheme here
    vim.cmd([[ colorscheme tokyonight ]])
  end,
}
