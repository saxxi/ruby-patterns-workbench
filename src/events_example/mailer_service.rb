class EventsExample
  class MailerService

    def self.set_listeners(app)
      app.subscribe('users.created') do |event|
        puts "EVENT #{event.id}"
        send_mail(event[:user])
      end
    end

    def self.send_mail(user)
      puts "ACTION: Send a welcome email to #{user}!"
    end

  end
end
