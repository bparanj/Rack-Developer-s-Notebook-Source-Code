use Rack::Session::Cookie, :key => 'rack.session', :domain => 'example.com',
:path => '/', :expire_after => 2592000, :secret => 'any_secret_key'

app = Proc.new do |env|
  user = env['rack.session'][:user] 
  env['rack.session'][:user] ||= 'test_user'
  [200, {"Content-Type" => "text/html"}, [user || "no current user"]]
end

run app

