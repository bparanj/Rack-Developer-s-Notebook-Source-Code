#!/usr/bin/env ruby

require 'rubygems'
require 'rack'
require 'thin'

app = Rack::Builder.new do
  use Rack::ContentLength
  map '/hello' do
    use Rack::CommonLogger
    map '/ketty' do
      run lambda { |env| 
        [200, {'Content-Type' => 'text/html'}, 
          ["from hello-ketty", 
            "SCRIPT_NAME=#{env['SCRIPT_NAME']}", 
            "PATH_INFO=#{env['PATH_INFO']}"]]
      }
    end
    map '/everyone' do
      run lambda {|env| [200, {"Content-Type" => 'text/html'},
        ["from hello-everyone",
          "SCRIPT_NAME=#{env['SCRIPT_NAME']}",
          "PATH_INFO=#{env['PATH_INFO']}"]]}
    end
    map '/' do
      run lambda {|env| [200, {'Content-Type' => 'text/html'},
        ['from catch all',
          "SCRIPT_NAME=#{env['SCRIPT_NAME']}",
          "PATH_INFO=#{env['PATH_INFO']}"]]
          }
    end
  end
  map '/world' do
    run lambda {|env| [200, {'Content-Type' => 'text/html'}, ["World "]]}
  end
  map '/' do
    run lambda {|env|[200, {'Content-Type' => 'text/html'},['here']]}
  end
  
end.to_app

Rack::Handler::Thin.run app, :Port => 3006