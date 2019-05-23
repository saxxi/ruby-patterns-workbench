describe DiHybrid::PaymentService do

  subject { DiHybrid::PaymentService.build }
  let(:ip) { 'THE.IP' }
  let(:user) { double(ip: ip) }
  let(:entity_attributes) {
    {
      city: 'London',
      region: 'England',
      country_code: 'UK',
    }
  }

  describe '#create_user_payment' do

    it 'creates a payment (mocks client build)' do
      client_double = double(geolocate_ip: entity_attributes)
      expect(DiHybrid::GeolocationService::Client).to(
        receive(:build).and_return(client_double)
      )

      result = subject.create_user_payment(user)
      expect(result).to eq 'England'
    end

    it 'creates a payment (mock using any_instance)' do
      expect_any_instance_of(DiHybrid::GeolocationService::Client).to(
        receive(:geolocate_ip).and_return(entity_attributes)
      )

      result = subject.create_user_payment(user)
      expect(result).to eq 'England'
    end

  end

end
