use Rack::ConditionalGet
class MyApp
  def call(env)
    [200, {"Content-Type"=>"text/html", "Etag"=>"12345678"}, self]
  end
  def each
    yield "hello world"
  end
end
run MyApp.new

