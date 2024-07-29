return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback"
      }
    },
    config = function(_, opts)
      require('conform').setup(opts)
    end,
  },
}
