require "rubygems" 
require "rack"
require "thin"

Rack::Handler::Thin.run lambda {|env| [200,{},[env.inspect]]} , :Port=>3005