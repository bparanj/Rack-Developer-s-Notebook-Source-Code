require "rubygems"
require "rack"
require "thin"
require 'decorator'

rack_app = lambda do |env|
  request = Rack::Request.new(env)
  response = Rack::Response.new
  
  if request.path_info == '/hello'
    response.write "Saying hi "
    client = request['client']
    response.write "for #{client}" if client
  else
    response.write "You need to provide the client information"
  end
  response.finish
end

Rack::Handler::Thin.run Decorator.new(rack_app), :Port => 3005