#!/usr/bin/env ruby
require 'rubygems'
require 'rack'
require 'thin'

app = Rack::Builder.new do
  use Rack::ContentLength
  map '/hello' do
    run lambda {|env| [200, {'Content-Type' => 'text/html'}, ['hi']]}
  end
  map '/world' do
    run lambda {|env| [200, {'Content-Type' => 'text/html'}, ['world']]}
  end
end.to_app

Rack::Handler::Thin.run app, :Port => 3006 