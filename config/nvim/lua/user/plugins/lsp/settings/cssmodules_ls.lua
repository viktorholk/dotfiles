return {
    on_attach = function(client, bufnr)
        -- avoid accepting `go-to-definition` responses from this LSP
        client.resolved_capabilities.goto_definition = false
        require('user.plugins.lsp.handlers').on_attach(client, bufnr)
    end
}
