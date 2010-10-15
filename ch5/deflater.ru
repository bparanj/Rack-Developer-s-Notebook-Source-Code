use Rack::Chunked
use Rack::Deflater
run lambda {|env| [200, {'Content-Type'=>"text/html"},["abcde"*1000]]}