return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      local treesitter = require('nvim-treesitter')
      local pending = {}
      local warned_about_cli = false

      local function is_small_file(buf)
        local path = vim.api.nvim_buf_get_name(buf)
        local stat = path ~= '' and vim.uv.fs_stat(path)
        return not stat or stat.size <= 100 * 1024
      end

      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('TreeSitterOnDemand', { clear = true }),
        callback = function(event)
          local buf = event.buf
          if vim.bo[buf].buftype ~= '' or not is_small_file(buf) then
            return
          end

          local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
          if not lang then
            return
          end

          local loaded, parser = pcall(vim.treesitter.language.add, lang)
          if loaded and parser then
            local started, err = pcall(vim.treesitter.start, buf)
            if not started then
              vim.notify('Could not start Tree-sitter for ' .. lang .. ': ' .. tostring(err), vim.log.levels.WARN)
            end
            return
          end

          if not vim.list_contains(treesitter.get_available(), lang) then
            return
          end

          if vim.fn.executable('tree-sitter') == 0 then
            if not warned_about_cli then
              vim.notify('Install tree-sitter-cli 0.26.1+ to add missing parsers', vim.log.levels.WARN)
              warned_about_cli = true
            end
            return
          end

          if pending[lang] then
            table.insert(pending[lang], buf)
            return
          end

          pending[lang] = { buf }
          treesitter.install(lang):await(function(err, installed)
            local buffers = pending[lang]
            pending[lang] = nil
            if err or not installed then
              vim.notify('Could not install Tree-sitter parser for ' .. lang .. ': ' .. tostring(err or 'see :TSLog'), vim.log.levels.WARN)
              return
            end
            for _, target in ipairs(buffers) do
              if vim.api.nvim_buf_is_valid(target)
                and vim.treesitter.language.get_lang(vim.bo[target].filetype) == lang
                and is_small_file(target) then
                local started, start_err = pcall(vim.treesitter.start, target)
                if not started then
                  vim.notify('Could not start Tree-sitter for ' .. lang .. ': ' .. tostring(start_err), vim.log.levels.WARN)
                end
              end
            end
          end)
        end,
      })

      vim.keymap.set({ 'n', 'x' }, '<C-Space>', function()
        vim.treesitter.select('parent')
      end, { desc = 'Expand Tree-sitter selection' })
      vim.keymap.set('x', '<S-Space>', function()
        vim.treesitter.select('child')
      end, { desc = 'Shrink Tree-sitter selection' })
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {},
  },
}
