module GeolocationServiceHelpers

  def geolocation_example_api_attributes
    {
      city: 'London',
      region_name: 'England',
      country_code: 'UK',
    }
  end

  def geolocation_stub_request(ip, reply: nil, status: 200)
    uri = "http://Settings.ipstack.url/#{ip}?access_key=Settings.ipstack.access_key"
    stub_request(:get, uri).to_return(
      status: status,
      body: (reply || geolocation_example_api_attributes).to_json,
      headers: {
        'Content-Type': 'application/json'
      }
    )
  end
end
