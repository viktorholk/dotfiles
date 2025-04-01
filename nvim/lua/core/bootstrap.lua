-- pin nvim to a specific node version, regardless of the project
local node_bin = "/Users/viktorholk/.nvm/versions/node/v22.14.0/bin"
vim.g.node_host_prog = node_bin .. "/node"

-- for mason.nvim
-- prereq - install lsp server in that node/bin npm i -g typescript-language-server
-- (handled by :Mason currently)
vim.cmd("let $PATH = '" .. node_bin .. ":' . $PATH")

-- Bootstrap lazy and setup plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
