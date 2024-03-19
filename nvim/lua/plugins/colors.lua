return {
  'rebelot/kanagawa.nvim',
  config = function()
    require('kanagawa').setup({
      transparent = false,
      background = {
        dark = "dragon",
        light = "lotus"
      },
    })

    -- setup must be called before loading
    vim.cmd("colorscheme kanagawa")
  end
}
