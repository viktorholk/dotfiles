return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          "c", "lua", "vim", "vimdoc", "markdown", "markdown_inline",
          "javascript", "typescript", "html", "css", "scss" },
        -- Automatically install missing parsers when entering buffer
        auto_install = true,
        highlight = {
          enable = true,
          -- disable slow treesitter highlight for large files
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<S-space>",
          },
        },
        autotag = { enable = true },
      })
    end
  },

  {
    'windwp/nvim-ts-autotag',
    event = "InsertEnter",
  }
}
