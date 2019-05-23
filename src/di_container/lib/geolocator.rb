class Geolocator

  def geolocation_from_ip(ip)
    geo_attributes = client.geolocate_ip(ip)
    # place here further manipulation logic
    geo_attributes # TODO: Convert to entity
  end

  protected

  def client
    ::DiContainer::Container['geolocator.client']
  end

end
