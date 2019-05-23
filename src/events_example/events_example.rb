require_relative './application'
require_relative './mailer_service'

class EventsExample

  def self.boot
    app = Application.new
    MailerService.set_listeners(app)
    app
  end

end
