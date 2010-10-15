#!/usr/bin/env ruby

require 'rubygems'
require 'rack'
require 'thin'

app = Rack::Builder.new do
  map '/hello' do
    run lambda { |env| 
      [200, {'Content-Type' => 'text/html'}, 
        ["SCRIPT_NAME=#{env['SCRIPT_NAME']} ", "PATH_INFO=#{env['PATH_INFO']}"]]
    }
  end
  map '/world' do
    run lambda {|env| [200, {'Content-Type' => 'text/html'}, ["World "]]}
  end
end.to_app

Rack::Handler::Thin.run app, :Port => 3006