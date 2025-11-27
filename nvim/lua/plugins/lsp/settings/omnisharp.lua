local lspconfig = require 'lspconfig'

return {
  cmd = {
    "/Users/viktorholk/omnisharp/OmniSharp",
    "--languageserver",
    "--hostPID",
    tostring(vim.fn.getpid())
  },
  filetypes = { "cs" },
  root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git"),
  settings = {
    FormattingOptions = {
      EnableEditorConfigSupport = true,
    },
    RoslynExtensionsOptions = {
      enableDecompilationSupport = false,
      enableImportCompletion = true,
      enableAnalyzersSupport = true,
    },
    Sdk = {
      IncludePrereleases = true,
    }
  }
}
