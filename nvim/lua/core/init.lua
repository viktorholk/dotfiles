require('core.options')
require('core.keymaps')
require('core.bootstrap')

require('lazy').setup('plugins', {
  change_detection = {
    notify = false,
  }
})

