require 'dry/events/publisher'

class DiContainer::PaymentService
  # include ::DiContainer::Container['geolocator']

  def self.create_user_payment(user)
    # ::DiContainer::Container.require_from_root(Pathname('lib/*.rb')) # Load by path one or more
    ::DiContainer::Container.load_component('geolocator') # Load single component by name

    geolocation = ::DiContainer::Geolocator.new.geolocation_from_ip(user.ip) # Example of usage
    puts geolocation

    # binding.pry
    # puts 'do stuff'
    # puts repo.greet
    # puts geolocation[:region]
    'aaa'
  end

end
