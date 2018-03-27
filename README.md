# LED panel #

## About ##

Software heard of a home-built LED panel. The panel is made of chainable [MAX7219]
modules consisting of a 8 × 8 single-color LED matrix and a controller. These
chained lego-blocks are connected do a [ESP8266] microcomputer.

The microcomputer connects to a MQTT server, which sends messages with LED
states. The [ESP8266] client is written in [MicroPython], the server is in
[Ruby].

## Current state ##

There is a stubby stub of the server, which does nothing more than sends some
JSON’s through RabbitMQ to a simple provided client.

## Requirements ##

* [RabbitMQ]

[MAX7219]: https://www.aliexpress.com/item/Free-shipping-10sets-lot-MAX7219-dot-matrix-module-microcontroller-module-for-arduino-display-module-finished-goods/2022544995.html
[ESP8266]: http://ESP8266.com/
[MicroPython]: http://micropython.org
[Ruby]: http://ruby-lang.org
[RabbitMQ]: https://www.rabbitmq.com/
