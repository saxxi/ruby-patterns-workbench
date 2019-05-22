describe ClassicRuby::PaymentService do

  let(:ip) { 'THE.IP' }
  let(:user) { double(ip: ip) }

  describe '#create_user_payment' do

    it 'creates a payment' do
      geolocation_stub_request(ip)                            # We have a side effect but don't want do deal with it
      result = ClassicRuby::PaymentService.create_user_payment(user)
      expect(result).to eq 'England'
    end

  end

end
