local function get_project_root()
  -- Try to find Gemfile in current file's directory and upwards
  local current_file = vim.api.nvim_buf_get_name(0)
  if current_file == "" then
    return vim.fn.getcwd()
  end
  local current_dir = vim.fn.fnamemodify(current_file, ':h')
  local root = require('lspconfig.util').root_pattern('Gemfile')(current_dir)
  if root then
    return root
  end
  -- Fallback to current working directory
  return vim.fn.getcwd()
end

return {
  cmd = { "bundle", "exec", "solargraph", "stdio", "--verbose" },
  root_dir = get_project_root(),
  cwd = get_project_root(),
  -- Add initialization options to handle shutdown gracefully
  init_options = {
    formatting = true
  },
  settings = {
    solargraph = {
      diagnostics = true,
      -- Reduce logging to avoid some threading issues
      logLevel = "warn"
    }
  }
}
