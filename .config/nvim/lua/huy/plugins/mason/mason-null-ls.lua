return {
  'jaypo521/mason-null-ls.nvim',

  config = function()
    require('mason-null-ls').setup({
      -- list of formatters and linters
      ensure_installed = {
        'prettier',   -- ts/js formatter
        'stylua',     -- lua formatter
        'clang-format',   -- cpp formatter
        'cpplint',     -- cpp linter
        'eslint_d',   -- ts/js linter
      },
      automatic_installation = true,
    })
  end
}
