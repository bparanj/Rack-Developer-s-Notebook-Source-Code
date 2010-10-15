class Decorator
  def initialize(app, *options, &block)
    @app = app
    @options = (options[0] || {})
  end
  def call(env)
    status, headers, body = @app.call(env)
    new_body = ""
    new_body << (@options[:header] || "------Header-----<br/>")
    body.each{|str| new_body << str}
    new_body << (@options[:footer] || "<br/>----Footer-------")
    [status, headers, [new_body]]
  end
end