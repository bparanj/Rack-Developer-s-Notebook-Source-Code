require 'rubygems'
require 'rack'
require 'builder'
require 'decorator'
require 'thin'

app = Builder.new do
  use Rack::ContentLength
  use Decorator
  run lambda{|env|[200, {'Content-Type' => 'text/html'}, ["Content Length and then Decorator"]]}
end.to_app

Rack::Handler::Thin.run app, :Port => 3000

