module ClassicRuby::GeolocationService
  class Geolocator

    # @param [String] ip
    # @return [Entities::Geolocation]
    def self.geolocation_from_ip(ip)
      geo_attributes = Client.geolocate_ip(ip)   # net call delegation
      # geo_attributes[:some_other_computed_value] = 33              # place for data manipulation logic
      Entities::Geolocation.new(geo_attributes)                      # return an Entity in our business domain
    end

  end
end
