use Rack::ConditionalGet
use Rack::ETag
run lambda{|env| [200, {'Content-Type'=>'text/html'},["any string here"]]}

# Run by : rackup etag.ru -p 3010