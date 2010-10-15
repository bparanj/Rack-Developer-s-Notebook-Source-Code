require "rubygems" 
require "rack"
require "thin"

rack_app = lambda do |env|
  request = Rack::Request.new(env)
  if request.path_info == '/guess'
     client = request['client']
     if client && client.downcase == 'safari'
       [200, {}, ["Good browser"]]
     else
       [200, {}, ["Choose another browser"]]
     end
   else
     [200, {}, ["You have to guess something"]]
   end
 end
 
Rack::Handler::Thin.run rack_app, :Port => 3005