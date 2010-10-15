
class Shouter
  def initialize(app)
    @next_in_chain = app
  end
  def call(env)
    status, headers, body = @next_in_chain.call(env)
    new_body = ""
    body.each {|str| new_body << str.upcase }
    [status, headers, [new_body]]
  end
end


require 'rubygems'
require 'rack'
require 'rack/content_length'

app = Builder.new do
  use Decorator
  use Rack::ContentLength
  run lambda {|env| [200, {"Content-Type" => "text/html" }, ["Content Length, Decorator"]]}
end.to_app

Rack::Handler::Thin.run app, :Port => 3005


app = Builder.new do
  use Decorator
  use Shouter
  run lambda do |env| 
    [200, {'Content-Type' => 'text/html'}, ["Decorator first - Shouter second"]]
  end
end.to_app

lambda{|app| middleware_class.new(app, *options, &block)}
