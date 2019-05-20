require './di_containers/start.rb'

describe GeolocationService do
  it "finds the Geolocation of 5" do
    # GeolocationService.geolocation_from_ip
    client = WebREST::HTTPClient.new(url: 'https://jsonplaceholder.typicode.com')
    resp = client.get '/todos/1'
    puts resp.body
    geolocation = GeolocationService::Entities::Geolocation.new city: 'something', region: 'something', country_code: 'something'
  end
end
