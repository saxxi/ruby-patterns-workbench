require 'rubygems'

require 'webmock'
require 'webmock/rspec'

require './src/config'
require './spec/support/geolocation_service_helpers'

RSpec.configure do |c|
  c.include ClassicRuby::GeolocationServiceHelpers
end
