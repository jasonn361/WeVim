-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- NOTE: First, some plugins that don't require any configuration

  -- -- Plugins dependency
  'nvim-lua/plenary.nvim',
  'nvim-tree/nvim-web-devicons',
  'MunifTanjim/nui.nvim',
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  -- Window maximizer
  'szw/vim-maximizer',

  -- Theme
  require 'huy.config.colorscheme',

  -- Essential plugins
  'tpope/vim-surround',                -- easy add and delete surrounding punct.
  'inkarkat/vim-ReplaceWithRegister',  -- copy and replace another word

  -- Commentting
  require 'huy.plugins.comment',

  -- File Explorer
  require 'huy.plugins.neo-tree',
  require 'huy.plugins.window-picker',

  -- Tmux-vim navigator
  'christoomey/vim-tmux-navigator',

  -- Lualine
  require 'huy.plugins.lualine',

  -- Indentation guides
  require 'huy.plugins.indent-blankline',

  -- Treesitter
  require 'huy.plugins.treesitter',
  'nvim-treesitter/playground',

  -- Better Notifications
  require 'huy.plugins.noice',
  require 'huy.plugins.nvim-notify',

  -- Better Tabs
  --require 'huy.plugins.barbar',

  -- Dashboard
  require 'huy.plugins.alpha-nvim',

  -- Telescope
  require 'huy.plugins.telescope',

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
}

local opts = {
  -- Starup settings
  install = {
    colorscheme = { 'tokyonight-moon' },
  },

  -- Lazy UI customization
  ui = {
    size = { width = 0.8, height = 0.8 },
    border = 'rounded',
  },
}


-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup(plugins, opts)
