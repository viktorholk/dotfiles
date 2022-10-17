return {
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    require('user.plugins.lsp.handlers').on_attach(client, bufnr)
  end
}
