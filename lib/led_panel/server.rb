require 'bunny'
require 'json'

module LEDPanel
  class Server
    # Create a new, uninitialized connection.
    def initialize
      @connection = Connection.new
    end

    # Run the server.
    def run
      @connection.queue do |queue|
        puts("Server started. Broadcasting to queue: “#{queue.name}”.")

        loop do
          message = $stdin.gets.chomp
          queue.broadcast(message.to_json)
        rescue Interrupt
          return
        end
      end
    end

  end
end
