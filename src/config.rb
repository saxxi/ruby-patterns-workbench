require 'active_support'
require 'active_support/core_ext'
require 'typhoeus'
require 'faraday'
require 'faraday_middleware'
require 'dry-struct'
require 'dry-validation'
require 'dry-container'

require 'pry'

ROOT = Pathname(__FILE__).dirname

require './lib/web_rest/http_client'

require_relative 'classic_ruby/start'
require_relative 'classic_ruby/geolocation_service/geolocator'
require_relative 'classic_ruby/geolocation_service/entities/types'
require_relative 'classic_ruby/geolocation_service/entities/geolocation'
require_relative 'classic_ruby/geolocation_service/client'
require_relative 'classic_ruby/payment_service'

require_relative 'di_container/start'

require_relative 'di_hybrid/start'
require_relative 'di_hybrid/geolocation_service/geolocator'
require_relative 'di_hybrid/geolocation_service/entities/types'
require_relative 'di_hybrid/geolocation_service/entities/geolocation'
require_relative 'di_hybrid/geolocation_service/client'
require_relative 'di_hybrid/payment_service'

require_relative 'events_example/events_example'
