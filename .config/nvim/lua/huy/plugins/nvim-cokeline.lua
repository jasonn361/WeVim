return {
  'willothy/nvim-cokeline',

  config = function()
    local get_hex = require('cokeline/utils').get_hex

    local color = '#fca7ea'

    require('cokeline').setup({
      default_hl = {
        focused = function(buffer)
          return
            buffer.is_focused
            and get_hex('Normal', 'fg')
             or get_hex('Comment', 'fg')
        end,
        bg = get_hex('ColorColumn', 'bg'),
      },

      sidebar = {
        filetype = 'neo-tree',
        components = {
          {
            text = '  Neo-Tree',
            fg = color,
            bg = get_hex('NeoTreeNormal', 'bg'),
            style = 'bold',
          },
        }
      },

      components = {
        {
          text = function(buffer) return (buffer.index ~= 1) and '▏' or '' end,
        },
        {
          text = '  ',
        },
        {
          text = function(buffer)
            return buffer.devicon.icon
          end,
          fg = function(buffer)
            return buffer.devicon.color
          end,
        },
        {
          text = ' ',
        },
        {
          text = function(buffer) return buffer.filename .. '  ' end,
          style = function(buffer)
            return buffer.is_focused and 'bold' or nil
          end,
        },
        {
          text = '',
          delete_buffer_on_left_click = true,
        },
        {
          text = '  ',
        },
      },
    })
  end,
}
