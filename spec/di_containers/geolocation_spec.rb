describe DiContainers::GeolocationService::Geolocator do

  subject { ::DiContainers::GeolocationService::Geolocator }
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
      geolocation_stub_request(ip, reply: geo_attributes)

      result = subject.geolocation_from_ip(ip)
      expect(result).to eq(
        ::DiContainers::GeolocationService::Entities::Geolocation.new({
          city: 'London',
          region: 'England',
          country_code: 'UK',
        })
      )
    end

    it 'fails brutally for invalid requests' do
      geolocation_stub_request(ip, reply: geo_attributes, status: 500)

      expect {
        subject.geolocation_from_ip(ip)
      }.to raise_error
    end

  end

end
