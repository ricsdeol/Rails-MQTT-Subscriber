#!/usr/bin/env ruby

# You might want to change this
ENV["RAILS_ENV"] ||= "development"

root = File.expand_path(File.dirname(__FILE__))
root = File.dirname(root) until File.exists?(File.join(root, 'config'))
Dir.chdir(root)

require File.join(root, "config", "environment")

$running = true
Signal.trap("TERM") do
  $running = false
end

client = MQTT::Client.connect('localhost')
client.subscribe( 'teste/#' )

while($running) do
  topic,message = client.get

  Package.create topic: topic, message: message if topic.present? && message.present?
end

client.disconnect
