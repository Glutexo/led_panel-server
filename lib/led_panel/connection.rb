module LEDPanel
  class Connection

    # Initialize a new RabbitMQ connection.
    def initialize
      @connection = Bunny.new
    end

    # Open a connection, set up a queue, do work, close the connection.
    def queue
      @connection.start

      channel = @connection.create_channel
      queue = channel.queue(QUEUE_NAME)

      yield(channel, queue)

      @connection.close
    end
  end
end