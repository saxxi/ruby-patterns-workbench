class DiHybrid::GeolocationService::Client

  attr_reader :client

  def self.build
    new(
      client: WebREST::HTTPClient.new(url: 'http://Settings.ipstack.url')
    )
  end

  def initialize(client:)
    @client = client
  end

  def geolocate_ip(ip)
    result = client.get("/#{ip}", params: base_params)
    {
      city: result.body['city'],
      region: result.body['region_name'],
      country_code: result.body['country_code'],
    }
  end

  def base_params
    { access_key: 'Settings.ipstack.access_key' }
  end

end
