Gem::Specification.new do |s|
  s.name        = 'led_panel-server'
  s.version     = '0.0.0'
  s.executables = ['bin/run']
  s.date        = '2018-01-27'
  s.summary     = "LED panel server"
  s.description = 'A server for Glutexo’s MAX7219 LED panel.'
  s.authors     = ['Glutexo']
  s.email       = 'glutexo@icloud.com'
  s.files       = ['lib/led_panel.rb', 'lib/led_panel/connection.rb', 'lib/led_panel/server.rb']
  s.homepage    = 'http://rubygems.org/gems/led_panel-server'
  s.license     = 'MIT'

  s.add_runtime_dependency('bunny', '~> 2.9.2')
end
