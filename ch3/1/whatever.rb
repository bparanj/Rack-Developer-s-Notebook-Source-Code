require 'rubygems'
require 'rack'
require 'thin'
require 'decorator'

rack_app = lambda{|env| [200, {'Content-Type' => 'text/html'}, ["whatever rack app"]]}

Rack::Handler::Thin.run Decorator.new(rack_app), :Port => 3005