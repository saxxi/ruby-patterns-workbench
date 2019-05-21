class PaymentService

  def self.create_user_payment(user)
    puts 'do stuff'
    geolocation = GeolocationService::Geolocator.geolocation_from_ip(user.ip)
    geolocation[:region]
  end

end
