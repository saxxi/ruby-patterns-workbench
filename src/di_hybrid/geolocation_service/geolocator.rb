module DiHybrid::GeolocationService
  class Geolocator

    attr_reader :client

    def self.build
      new(
        client: Client.build,
      )
    end

    def initialize(client:)
      @client = client
    end

    # @param [String] ip
    # @return [Entities::Geolocation]
    def geolocation_from_ip(ip)
      geo_attributes = client.geolocate_ip(ip)   # net call delegation
      # geo_attributes[:some_other_computed_value] = 33              # place for data manipulation logic
      Entities::Geolocation.new(geo_attributes)                      # return an Entity in our business domain
    end

  end
end
