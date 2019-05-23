require 'dry/events/publisher'

class DiContainer::PaymentService

  # Load on the fly examples
  # def initialize
  #   ::DiContainer::Container.require_from_root(Pathname('lib/*.rb'))  # 1) Load by path one or more
  #   ::DiContainer::Container.load_component('geolocator')             # 2) Load single component by name
  #   puts ::DiContainer::Geolocator.new.geolocation_from_ip(user.ip)   # Example of usage
  # end

  def self.create_user_payment(user)
    geolocation = geolocator.geolocation_from_ip(user.ip)
    geolocation[:region]
  end

  protected

  def self.geolocator
    ::DiContainer::Container['geolocator']
  end

end
