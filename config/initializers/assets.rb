# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')


# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.

# %w( cart carts charges customer home line_items merchants orders products registration   ).each do |controller|
#   # Rails.application.config.assets.precompile += ["#{controller}.js", "#{controller}.css"]
#   Rails.application.config.assets.precompile += ["#{controller}.css"]
# end
Rails.application.config.assets.precompile += %w( active_admin.js active_admin.css cart.css carts.css
        charges.css customer.css home.css isotope.pkgd.min.js
        line_items.css merchants.css orders.css products.css pdf.css registration.css single_custom.js jquery-3.2.1.min.js)
