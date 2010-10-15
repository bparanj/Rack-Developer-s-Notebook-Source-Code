require 'rubygems'
require 'rack'
require 'thin'
require 'rack/content_length'
require 'decorator'
require 'builder'

app = Builder.new do
  use Rack::ContentLength
  use Decorator, :header => "*****header*****<br/>"
  run lambda {|env| [200, {'Content-Type' => 'text/html'}, ["Hello"]]}
end.to_app

Rack::Handler::Thin.run app, :Port => 3006