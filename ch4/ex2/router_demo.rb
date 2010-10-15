#!/usr/bin/env ruby

require 'rubygems'
require 'rack'
require 'thin'

app = Rack::Builder.new do
  map '/hello' do
    run lambda {|env| [200, {'Content-Type' => 'text/html'}, ["Hello "]]}
  end
  map '/world' do
    run lambda {|env| [200, {'Content-Type' => 'text/html'}, ["World "]]}
  end
  map '/' do
    run lambda {|env| [200, {'Content-Type' => 'text/html'}, ["How y'll doin?"]]}
  end
end.to_app

Rack::Handler::Thin.run app, :Port => 3006