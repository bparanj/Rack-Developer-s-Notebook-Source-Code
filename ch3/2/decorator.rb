class Decorator
  def initialize(app)
    @next_in_chain = app
  end
  def call(env)
    status, headers, body = @next_in_chain.call(env)
    new_body = "-------------Header---------------<br/>"
    body.each{ |s| new_body << s }
    new_body << "<br/>------------Footer------------"
    headers['Content-Length'] = new_body.bytesize.to_s
    [status, headers, [new_body]]
  end
end