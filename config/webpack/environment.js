const { environment } = require('@rails/webpacker')

module.exports = environment

// 24章railsにbootstrapを導入する
const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: 'popper.js'
  })
)