vim.cmd [[set guicursor= ]]
return {
  lsp = {
    formatting = {
      format_on_save = {
        enabled = true, -- enable format on save
        allow_filetypes = { -- only allow formatting on save for these filetypes
          "lua",
          "python",
          "java",
          "javascript",
        },
      },
    },
  },
  colorscheme = "nord",
  plugins = {
    {
      "shaunsingh/nord.nvim",
      as = "nord",
      config = function() require("nord").setup {} end,
    },
    ["null-ls"] = function(config)
      local null_ls = require "null-ls"
      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        -- null_ls.builtins.formatting.rufo,
        --null_ls.builtins.formatting.autopep8,
        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.flake8,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.flake8,

        -- Set a linter
        -- null_ls.builtins.diagnostics.rubocop,
      }
      return config
    end,
  },
}
