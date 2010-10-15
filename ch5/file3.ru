require 'decorator2'

use Rack::ContentLength
use Rack::ContentType, "text/plain"
use Decorator2
run lambda {|env| [200, {}, File.new(env['PATH_INFO'][1..-1])] }