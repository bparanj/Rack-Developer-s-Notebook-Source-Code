#  Change the lines 8 and 9 of ex2.rb to illustrate the order of middleware can affect output
# use Decorator
# use Rack::ContentLength

require 'rubygems'
require 'rack'
require 'rack/content_length'

app = Builder.new do
  use Decorator
  use Rack::ContentLength
  run lambda {|env| [200, {"Content-Type" => "text/html" }, ["Decorator, Content Length"]]}
end.to_app

Rack::Handler::Thin.run app, :Port => 3005