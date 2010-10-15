#!/usr/bin/env ruby

# Put the following in a startup file so that require 'decorator' will work. 
# This is required only for Ruby 1.9.2dev version
$: << File.expand_path(File.dirname(__FILE__))
# Above line avoids doing this
# require File.expand_path(File.dirname(__FILE__))

require 'rubygems'
require 'rack'
require 'decorator'
require 'thin'
require 'rack/handler'

app = Rack::Builder.new do
  use Rack::ContentLength
  use Decorator, :header => "-----------<br/>"
  run lambda {|env| [200, {'Content-Type' => 'text/html'}, ["Hi"]]}
end.to_app

Rack::Handler::Thin.run app, :Port => 3006
