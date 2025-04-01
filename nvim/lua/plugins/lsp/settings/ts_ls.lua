return {
    root_dir = util.root_pattern('.git'),
    init_options = {
        typescript = {
            tsdk = './node_modules/typescript/lib'
        },
        preferences = {
            importModuleSpecifierPreference = 'non-relative'
        }
    },

}
