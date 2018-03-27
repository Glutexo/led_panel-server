require 'bunny'
require 'json'

module LEDPanel
  class Server
    # Create a new, uninitialized connection.
    def initialize
      @connection = Bunny.new
    end

    # Run the server.
    def run
      with_connection do |con|
        channel = con.create_channel
        queue = channel.queue(QUEUE_NAME)

        puts("Server started. Broadcasting to queue: “#{queue.name}”.")
        loop do
          message = $stdin.gets.chomp
          channel.default_exchange.publish(message.to_json, routing_key: queue.name)
        rescue Interrupt
          return
        end
      end
    end

    private

      # Open a connection, do work, close the connection.
      def with_connection
        @connection.start
        yield(@connection)
        @connection.close
      end

  end
end
