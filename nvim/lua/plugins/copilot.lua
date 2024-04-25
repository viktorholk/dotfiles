return {
  {
    'zbirenbaum/copilot.lua',
    config = function()
      require('copilot').setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
        filetypes = {
          javascript = true, -- allow specific filetype
          typescript = true, -- allow specific filetype
          rust = true,
          ruby = true,
          lua = true,
          ["*"] = false,     -- disable for all other filetypes and ignore default `filetypes`
        },

      })
    end
  },
  { 'zbirenbaum/copilot-cmp', config = true }
}
