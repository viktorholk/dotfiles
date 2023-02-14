-- Keymap functions
local mappings = {}

local function map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts, opts or { silent = true })
end

local function noremap(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts, opts or { noremap = true, silent = true })
end

function mappings.nmap(lhs, rhs, opts) map('n', lhs, rhs, opts) end

function mappings.nnoremap(lhs, rhs, opts) noremap('n', lhs, rhs, opts) end

function mappings.vnoremap(lhs, rhs, opts) noremap('v', lhs, rhs, opts) end

function mappings.xnoremap(lhs, rhs, opts) noremap('x', lhs, rhs, opts) end

function mappings.inoremap(lhs, rhs, opts) noremap('i', lhs, rhs, opts) end

function mappings.tnoremap(lhs, rhs, opts) noremap('t', lhs, rhs, opts) end

return mappings
