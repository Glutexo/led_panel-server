module LEDPanel
  class Queue

    # Create a communication channel, set up a queue.
    def initialize(connection)
      @channel = connection.create_channel
      @queue = @channel.queue(QUEUE_NAME)
    end

    # Get the queue name.
    def name
      @queue.name
    end

    # Broadcast a message to the queue.
    def broadcast(message)
      @channel.default_exchange.publish(message, routing_key: @queue.name)
    end

    # Wait for a message, pass it to a block.
    def listen
      @queue.subscribe(block: true) do |delivery_info, properties, body|
        puts(body)
      end
    end
  end
end