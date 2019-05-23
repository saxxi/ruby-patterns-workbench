
describe 'EventsExample' do

  let(:app) { EventsExample.boot }

  it 'shows an example of testing of side effects' do
    expect(EventsExample::MailerService).to receive(:send_mail).with('Jane')
    app.publish('users.created', user: 'Jane') # eg. in `User` -> `after_commit :dispatch_event, on: :create`
  end

end
