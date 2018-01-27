require 'socket'

module Ledpanel
  class Server

    def initialize
      @server = TCPServer.new 9999
    end

    def run
      loop do
        client = @server.accept
        client.puts 'Hello world!'
        client.close
      end
    end
  end
end
