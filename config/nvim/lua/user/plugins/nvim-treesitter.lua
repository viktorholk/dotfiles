local configs_status_ok, nvim_treesitter_configs = pcall(require, 'nvim-treesitter.configs')
if not configs_status_ok then
  return
end

-- Run TSUpdate
local install_status_ok, nvim_treesitter_install = pcall(require, 'nvim-treesitter.install')
if not install_status_ok then
  return
end

nvim_treesitter_configs.setup {
  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    enable = true,
    disable = { 'html' } -- default syntax highlighting for HTML works better
  }
}

-- TSUpdate
nvim_treesitter_install.update({ with_sync = true })
