return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  opts = function()
    local db = require('alpha.themes.dashboard')
    db.section.header.val = {
      '███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
      '████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
      '██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
      '██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
      '██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
      '╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
    }

    return db
  end,

  config = function(_, db)
    -- close lazy and re-open when the dashboard is ready
    if vim.o.filetype == 'lazy' then
      vim.cmd.close()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'AlphaReady',
        callback = function()
          require('lazy').show()
        end,
      })
    end
    require('alpha').setup(db.opts)

    vim.api.nvim_create_autocmd('User', {
      pattern = 'LazyVimStarted',
      callback = function()
        local stats = require('lazy').stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        db.section.footer.val = '⚡ Neovim loaded ' .. stats.count .. ' plugins in ' .. ms .. 'ms'
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
