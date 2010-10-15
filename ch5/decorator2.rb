class Decorator2
  def initialize(app, *options, &block)
    @app = app
    @options = (options[0] || {})
  end
  def call(env)
    status, headers, @body = @app.call(env)
    @header = (@options[:header] || '-----Header-----')
    @footer = (@options[:footer] || '-----Footer-----')
    [status, headers, self]
  end
  
  def each(&block)
    block.call @header
    @body.each(&block)
    block.call @footer
  end
end