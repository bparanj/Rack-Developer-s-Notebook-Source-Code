apps = [lambda {|env| [404, {}, ["File doesn't exists"]]}, 
        lambda {|env| [200, {}, ["I'm ok"]]}]
use Rack::ContentLength 
use Rack::ContentType 
run Rack::Cascade.new(apps)
