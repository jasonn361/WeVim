return {
  'glepnir/lspsaga.nvim',
  branch = 'main',

  config = function()
    require('lspsaga').setup({
      -- keybinds for navigation is lspsaga window
      scroll_preview = { scroll_down = '<C-f>', scroll_up = '<C-b>' },
      -- use enter to open file with definition preview
      definition = {
        edit = '<CR>',
      },
      ui = {
        colors = {
          normal_bg = '#022746',
        },
      },
      lightbulb = {
        enabled = false,
      },
    })
  end
}
