local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
  return
end

bufferline.setup {
  options = {
    mode = 'tabs',
    offsets = { { filetype = 'NvimTree', text = '', padding = 1 } },
    diagnostics = 'nvim_lsp'
  }
}
