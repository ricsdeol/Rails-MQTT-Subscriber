#!/usr/bin/env ruby

# You might want to change this
ENV["RAILS_ENV"] ||= "production"

root = File.expand_path(File.dirname(__FILE__))
root = File.dirname(root) until File.exists?(File.join(root, 'config'))
Dir.chdir(root)

require File.join(root, "config", "environment")

$running = true
Signal.trap("TERM") do
  $running = false
end

client = MQTT::Client.connect('localhost')

while($running) do
  client.publish("teste/#{rand(10)}/#{rand(10)}", rand(100))
  sleep 1
end

client.disconnect
