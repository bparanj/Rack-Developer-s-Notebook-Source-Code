#!/usr/bin/env ruby 
require "rubygems" 
require 'rack'
require 'thin'

app = Rack::Builder.new do 
  use Rack::ContentLength 
  map '/hello' do
    run lambda {|env| [200, {"Content-Type" => "text/html"}, ["hello"]] } }
  end.to_app
end 

Rack::Handler::Thin.run app, :Port => 3006