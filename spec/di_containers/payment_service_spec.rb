
describe 'DiContainer::PaymentService' do

  subject { DiContainer::PaymentService }
  let(:ip) { 'THE.IP' }
  let(:user) { double(ip: ip) }
  let(:client) { double }
  let(:geo_attributes) {
    {
      city: 'London',
      region: 'England',
      country_code: 'UK',
    }
  }

  before do
    expect(client).to receive(:geolocate_ip).with(ip).and_return(geo_attributes)
    ::DiContainer::Container.stub 'geolocator.client', client
  end

  it '#create_user_payment' do
    expect(subject.create_user_payment(user)).to eq 'England'
  end

end
