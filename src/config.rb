require 'active_support'
require 'active_support/core_ext'
require 'typhoeus'
require 'faraday'
require 'faraday_middleware'
require 'dry-struct'
require 'dry-validation'
require 'dry-container'

require 'pry'

require './lib/web_rest/http_client'

require_relative 'classic_ruby/classic_ruby'
require_relative 'classic_ruby/geolocation_service/geolocator'
require_relative 'classic_ruby/geolocation_service/entities/types'
require_relative 'classic_ruby/geolocation_service/entities/geolocation'
require_relative 'classic_ruby/geolocation_service/client'
require_relative 'classic_ruby/payment_service'

