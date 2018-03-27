module LEDPanel
  class Queue

    # Creates a communication channel, sets up a queue.
    def initialize(connection)
      @channel = connection.create_channel
      @queue = @channel.queue(QUEUE_NAME)
    end

    # Gets the queue name.
    def name
      @queue.name
    end

    # Broadcasts a message to the queue
    def broadcast(message)
      @channel.default_exchange.publish(message, routing_key: @queue.name)
    end

    # Waits for a message, passes it to a block
    def listen
      @queue.subscribe(block: true) do |delivery_info, properties, body|
        puts(body)
      end
    end
  end
end