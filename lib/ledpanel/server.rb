require 'socket'
require 'json'

module Ledpanel
  class Server

    def initialize(port)
      @server = TCPServer.new port
      @client = nil
    end

    # Run the server.
    def run
      serve
    end

    # Handle incomming connection: send a hello message and close.
    def serve
      loop do
        @client = @server.accept
        @client.puts 'Hello!'
        loop do
          msg = $stdin.gets.chomp
          @client.print(msg.to_json + "\n")
          # @TODO Detect if client closes the connection.
        end
      end
    end
  end
end
