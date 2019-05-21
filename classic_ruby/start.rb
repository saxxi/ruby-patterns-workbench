require 'active_support'
require 'active_support/core_ext'
require 'typhoeus'
require 'faraday'
require 'faraday_middleware'
require 'dry-struct'
require 'dry-validation'

require 'pry'
require 'webmock'
require 'webmock/rspec'

require './lib/web_rest/http_client'

require_relative 'geolocation_service/geolocator'
require_relative 'geolocation_service/entities/types'
require_relative 'geolocation_service/entities/geolocation'
require_relative 'geolocation_service/client'

require_relative 'payment_service'