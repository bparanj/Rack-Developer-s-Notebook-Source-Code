require 'rubygems'
require 'rack'
require 'builder'
require 'decorator'
require 'thin'

app = Builder.new do
  use Decorator
  run lambda{|env| [200, {}, ["Hi"]]}
end.to_app

Rack::Hanlder::Thin.run app, :Port => 3000 