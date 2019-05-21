require 'rubygems'

require 'webmock'
require 'webmock/rspec'

require './spec/support/geolocation_service_helpers'
require './classic_ruby/start.rb'

RSpec.configure do |c|
  c.include GeolocationServiceHelpers
end
