class EventsExample
  class Application
    include ::Dry::Events::Publisher[:my_publisher]

    register_event('users.created')
  end
end
