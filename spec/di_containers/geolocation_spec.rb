require './spec/support/geolocation_service_helpers'
require './di_containers/start.rb'

RSpec.configure do |c|
  c.include GeolocationServiceHelpers
end

describe GeolocationService::Geolocator do

  let(:ip) { 'THE.IP' }
  let(:geo_attributes) {
    {
      city: 'London',
      region_name: 'England',
      country_code: 'UK',
    }
  }

  describe '#geolocation_from_ip' do

    it 'returns a geolocation from an ip address' do
      geolocation_stub_request(ip, geo_attributes)

      result = GeolocationService::Geolocator.geolocation_from_ip(ip)
      expect(result).to eq(
        GeolocationService::Entities::Geolocation.new({
          city: 'London',
          region: 'England',
          country_code: 'UK',
        })
      )
    end

    it 'fails brutally for invalid requests' do
      geolocation_stub_request(ip, geo_attributes, status: 500)

      expect {
        GeolocationService::Geolocator.geolocation_from_ip(ip)
      }.to raise_error
    end

  end

end
