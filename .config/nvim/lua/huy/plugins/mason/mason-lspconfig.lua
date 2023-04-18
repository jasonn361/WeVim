return {
  'williamboman/mason-lspconfig.nvim',
  
  config = function()
    require('mason-lspconfig').setup({
      -- list of servers for mason to install
      ensure_installed = {
        'tsserver',
        'html',
        'cssls',
        'lua_ls',
        'emmet_ls',
        'clangd',
      },
      automatic_installation = true,
    })
  end
}
