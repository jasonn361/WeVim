return { 
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v2.x',

  config = function()
    --vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

    require('neo-tree').setup({
      -- Source list
      sources = {
        'filesystem',
        'buffers',
        'git_status',
      },
      
      add_blank_line_at_top = false, -- Add a blank line at the top of the tree.
      popup_border_style = 'rounded',   -- Round pop-up

      -- Tab customization
      source_selector = {
        winbar = false,        -- show selector on top
        statusline = false,   -- show selector on bottom
        show_scrolled_of_parent_node = true,   -- replace tabs with parent
                                                -- with parent path when scrolled down
        -- Tab Icons
        tab_labels = {
          filesystem = ' Files',
          git_status = ' Git',
        },

        content_layout = 'center',
        tabs_layout = 'equal', 
      },

      -- Events
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.cmd 'highlight! Cursor blend=100'
          end
        },
        {
          event = "neo_tree_buffer_leave",
          handler = function()
            vim.cmd 'highlight! Cursor guibg=#5f87af blend=0'
          end
        },
      },
      
      -- File Explorer Symbols
      default_component = {
        icon = {
          folder_closed = '',
          folder_open = '',
          folder_empty = '',
          folder_empty_open = '',
        },
        
        -- Git Symbols
        git_status = {
          symbols = {
            -- Change type
            modified = '~',
          },
        },
      },
      
      -- Window settings
      window = {
        -- Custom mappings
        mappings = {
          ['<2-LeftMouse>'] = 'open_with_window_picker',
          ['<CR>'] = 'open_with_window_picker',
        },
      },
      
      filesystem = {
        window = {
         -- vim.cmd 'highlight! Cursor blend=100'
        },
      },

    })
  end,
}
