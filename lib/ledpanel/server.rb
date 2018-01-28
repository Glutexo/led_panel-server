require 'socket'

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
      @client = @server.accept
      @client.puts 'Hello!'
      @client.close
    end
  end
end
