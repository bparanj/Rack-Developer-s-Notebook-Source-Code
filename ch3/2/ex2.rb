require 'rubygems'
require 'rack'
require 'thin'

inspector = lambda{|env| [200, {'Content-Type' => 'text/html'}, env.inspect]}

builder = Rack::Builder.new
builder.run inspector

Rack::Handler::Thin.run builder, :Port => 3000 