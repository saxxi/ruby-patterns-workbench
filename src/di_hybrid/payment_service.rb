class DiHybrid::PaymentService
  attr_reader :geolocator

  def self.build
    new(
      geolocator: DiHybrid::GeolocationService::Geolocator.build,
      # other dependencies here
    )
  end

  def initialize(geolocator:)
    @geolocator = geolocator
  end

  def create_user_payment(user)
    puts 'do stuff'
    geolocation = geolocator.geolocation_from_ip(user.ip)
    geolocation[:region]
  end

end
