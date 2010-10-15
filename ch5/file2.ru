require 'decorator'

use Rack::ContentLength
use Rack::ContentType, "text/plain"
use Decorator
run lambda {|env| [200, {}, File.new(env['PATH_INFO'][1..-1])] }