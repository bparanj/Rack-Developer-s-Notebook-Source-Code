require 'rubygems'
require 'rack'
require 'thin'
require 'decorator'

builder = Rack::Builder.new do
  use Rack::ContentLength
  use Decorator
  run lambda{|env| [200, {'Content-Type' => 'text/html'}, ["Hello from builder"]]}
end

Rack::Handler::Thin.run Decorator.new(builder), :Port => 3000 