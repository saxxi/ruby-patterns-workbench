require './di_containers/start.rb'

describe GeolocationService::Geolocator do

  let(:ip) { '211.172.2.63' }
  let(:client) { double }
  let(:body) {
    {
      'city': 'some',
      'region_name': 'some',
      'country_code': 'some',
    }
  }

  it 'works' do
    stub_request(:get, "http://something.com/211.172.2.63?access_key=Settings.ipstack.access_key").
      with(
        headers: {
          'Expect'=>'',
          'User-Agent'=>'Faraday v0.15.4'
        }
      ).to_return(status: 200, body: body.to_json, headers: {})

    result = GeolocationService::Geolocator.geolocation_from_ip(ip)
    puts result.inspect
  end

end
