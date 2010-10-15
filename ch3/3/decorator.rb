class Decorator
  def initialize(app)
    @app = app
  end
  def call(env)
    status, headers, body = @app.call(env)
    new_body = "-----------Header-------------<br/>"
    body.each { |str| new_body << str }
    new_body << "<br/>--------Footer--------------"
    [status, headers, [new_body]]
  end
end