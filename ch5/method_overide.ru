use Rack::MethodOverride
map '/' do
  form = <<-HERE
  <form action="/user" method="post">
  <input name="_method" type="hidden" value="put" />
  <input name="name" type="text" value="" />
  <input type="submit" value="Modify!">
  </form>
  HERE
  run lambda {|env| [200, {"Content-Type" => "text/html"}, [form]] }
end

map '/user' do
  run lambda {|env|
    req = Rack::Request.new env
    res = Rack::Response.new
    if(req.put?)
      res.write("Your modified user name to #{req.params['name']}")
    else
      res.write("We only support put method to modify user, yours is #{req.request_method}")
    end
    res.finish
  }
end