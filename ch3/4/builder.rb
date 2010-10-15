class Builder
  def initialize(&block)
    @middleware_list = []
    self.instance_eval(&block)
  end
  def use(middleware_class, *options, &block)
    @middleware_list << lambda{|app| middleware_class.new(app, *options, &block)}
  end
  def run(app)
    @app = app
  end
  def to_app
    @middleware_list.reverse.inject(@app) do |app, middleware|
      middleware.call(app)
    end
  end
end