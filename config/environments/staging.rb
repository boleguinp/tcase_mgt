
# Based on production defaults
require Rails.root.join("config/environments/production")

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.
  Rails.application.routes.default_url_options[:host] = 'https://staging-tcasemgt.herokuapp.com/'
end
