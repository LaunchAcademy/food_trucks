require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module FoodTrucks
  class Application < Rails::Application
  end
end
