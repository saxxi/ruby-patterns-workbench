require 'rubygems'

require 'webmock'
require 'webmock/rspec'

require './src/config'
require './spec/support/geolocation_service_helpers'

require 'dry/system/stubs'

DiContainer::Container.enable_stubs!
DiContainer::Container.finalize!

RSpec.configure do |c|
  c.include ClassicRuby::GeolocationServiceHelpers
end
