return {
  cmd = { "bundle", "exec", "solargraph", "stdio", "--verbose" },
  root_dir = function(bufnr, cb)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local root = vim.fs.root(fname, 'Gemfile') or vim.fn.getcwd()
    cb(root)
  end,
  init_options = {
    formatting = true,
  },
  settings = {
    solargraph = {
      diagnostics = true,
      logLevel = "warn",
    },
  },
}
