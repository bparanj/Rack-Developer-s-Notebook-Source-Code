require "rubygems"
require "rack"
require "thin"

rack_app = lambda do |env|
  request = Rack::Request.new(env)
  response = Rack::Response.new
  response.write "---------------Header-------------<br/>"
  
  if request.path_info == '/hello'
    response.write "Saying hi "
    client = request['client']
    response.write "for #{client}" if client
  else
    response.write "You need to provide the client information"
  end
  response.write "<br/>----------footer-----------------"
  response.finish
end

Rack::Handler::Thin.run rack_app, :Port => 3005