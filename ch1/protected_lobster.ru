require 'rubygems'
require 'rack/lobster'

use Rack::ShowExceptions
use Rack::Auth::Basic, "Lobster 2.0" do |username, password|
  'test' == password
end

run Rack::Lobster.new