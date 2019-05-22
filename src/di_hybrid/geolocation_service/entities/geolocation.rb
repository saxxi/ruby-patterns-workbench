module DiHybrid::GeolocationService
  module Entities
    class Geolocation < Dry::Struct
      transform_keys(&:to_sym)

      attribute :city, Types::Strict::String.optional
      attribute :region, Types::Strict::String.optional
      attribute :country_code, Types::Strict::String.optional
    end
  end
end
