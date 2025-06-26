return {
  root_dir = util.root_pattern('.git'),
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
        languages = { "javascript", "typescript", "vue" },
      },
    },

    filetypes = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "vue",
    },
    typescript = {
      tsdk = './node_modules/typescript/lib'
    },
    preferences = {
      importModuleSpecifierPreference = 'non-relative'
    }
  },

}
