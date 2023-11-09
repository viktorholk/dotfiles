require('core')

require('lazy').setup('plugins', {
  change_detection = {
    notify = false,
  }
})


-- Open telescope oldfiles on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argv(0) == "" then
      require("telescope.builtin").oldfiles()
    end
  end,
})
