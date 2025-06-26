local lspconfig = require 'lspconfig'

return {
  cmd = {
    "omnisharp",
    "--languageserver",
    "--hostPID",
    tostring(vim.fn.getpid())
  },
  settings = {
    RoslynExtensionsOptions = {
      enableDecompilationSupport = false,
      enableImportCompletion = true,
      enableAnalyzersSupport = true,
    }
  },
  root_dir = lspconfig.util.root_pattern("*.sln")
}
