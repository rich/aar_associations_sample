# Be sure to restart your server when you modify this file

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.1.0' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem "fatjam-acts_as_revisable", :lib => "acts_as_revisable", :version => ">= 0.9.2", :source => "http://gems.github.com"
  
  config.time_zone = 'UTC'

  config.action_controller.session = {
    :session_key => '_lundie_session',
    :secret      => 'b26f1e1d808644604345ff758293b4e0c97a8aff5bb61fb11247ebe9ebd0eeef292b2545c4546acf99dfa3d2967854da3e73aa12d330bd28965ccc7c6068c620'
  }
end
