return {
  'neovim/nvim-lspconfig',

  config = function()
    local cmp_nvim_lsp = require('cmp_nvim_lsp')
    local typescript = require('typescript')
    local keymap = vim.keymap

    local on_attach = function(client, bufnr)
      -- keybind options
      local opts = { noremap = true, silent = true, buffer = bufnr }

      -- set keybinds
     -- typscript specific keymaps (e.g. rename file and update imports)
      if client.name == 'tsserver' then
        keymap.set('n', '<leader>rf', ':TypescriptRenameFile<CR>')   -- rename file and update imports
        keymap.set('n', '<leader>oi', ':TypescriptOrganizeImports<CR>')   -- organize imports
        keymap.set('n', '<leader>ru', ':TypescriptRemoveUnused<CR>')   -- remove unused variables 
      end
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()
    capabilities.offsetEncoding = 'utf-8'

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = ' ', Warn = ' ', Hint = 'ﴞ ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end

    -- configure typescript server
    typescript.setup({
      server = {
        capabilities = capabilities,
        on_attach = on_attach,
      }
    })

    -- configure markdown server
    require('lspconfig')['marksman'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure latex server
    require('lspconfig')['texlab'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure cpp server
    require('lspconfig')['clangd'].setup({
      server = {
        capabilities = capabilities,
        on_attach = on_attach,
      }
    })
    -- configure css server
    require('lspconfig')['cssls'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    -- configure html server
    require('lspconfig')['emmet_ls'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { 'hmtl', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte' },
    })

    -- configure lua server (with special settings)
    require('lspconfig')['lua_ls'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {   -- custom settings for lua
        Lua = {
          -- make the language server recognize 'vim' global
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            -- make language server awate of runtime files
            library = {
              [vim.fn.expand('$VIMRUNTIME/lua')] = true,
              [vim.fn.stdpath('config') .. '/lua'] = true,
            },
          },
        },
      },
    })
  end,
}
