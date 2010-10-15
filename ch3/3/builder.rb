class Builder
  def initialize(&block)
    @middleware_list = []
    self.instance_eval(&block)
  end
  def use(middleware)
    @middleware_list << middleware
  end
  def run(app)
    @app = app
  end
  def to_app
    @middleware_list.reverse.inject(@app) do |app, middleware| 
      middleware.new(app)
    end
  end
end
