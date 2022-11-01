-- Keymap functions
local mappings = {}

local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end

local function noremap(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true })
end

function mappings.nmap(lhs, rhs) map('n', lhs, rhs) end

function mappings.xmap(lhs, rhs) map('x', lhs, rhs) end

function mappings.nnoremap(lhs, rhs) noremap('n', lhs, rhs) end

function mappings.vnoremap(lhs, rhs) noremap('v', lhs, rhs) end

function mappings.xnoremap(lhs, rhs) noremap('x', lhs, rhs) end

function mappings.inoremap(lhs, rhs) noremap('i', lhs, rhs) end

function mappings.tnoremap(lhs, rhs) noremap('t', lhs, rhs) end

return mappings
