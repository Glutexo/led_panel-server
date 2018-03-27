module LEDPanel
  class Connection

    # Initialize a new RabbitMQ connection.
    def initialize
      @connection = Bunny.new
    end

    # Open a connection, set up a queue, do work, close the connection.
    def queue
      @connection.start

      queue = Queue.new(@connection)
      yield(queue)

      @connection.close
    end
  end
end