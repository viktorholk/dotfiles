return {
  root_dir = function(bufnr, cb)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local root = vim.fs.root(fname, '.git')
    if root then cb(root) end
  end,
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
        languages = { "javascript", "typescript", "vue" },
      },
    },

    filetypes = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "vue",
    },
    typescript = {
      tsdk = './node_modules/typescript/lib'
    },
    preferences = {
      importModuleSpecifierPreference = 'non-relative'
    }
  },

}
