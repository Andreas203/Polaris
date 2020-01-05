require_relative 'boot'

require 'rails/all'
# doc_ref.set(
#   first: "Ada",
#   last:  "Lovelace",
#   born:  1815
# )
# doc_ref.set(
#   first:  "Alan",
#   middle: "Mathison",
#   last:   "Turing",
#   born:   1912
# )

# puts "Added data to the aturing document in the users collection."

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ror
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
