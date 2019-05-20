module GeolocationServiceHelpers
  def geolocation_stub_request(ip, expected_attributes, status: 200)
    uri = "http://Settings.ipstack.url/#{ip}?access_key=Settings.ipstack.access_key"
    stub_request(:get, uri).to_return(
      status: status,
      body: expected_attributes.to_json,
      headers: {
        'Content-Type': 'application/json'
      }
    )
  end
end
