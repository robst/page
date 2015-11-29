class BasePresenter < SimpleDelegator
  attr_accessor :options
  def initialize model, view, options={}
    @view = view
    self.options = available_options.merge options
    super(model)
  end

  private

  def available_options
    {excerpt: false}
  end

  def h
    @view
  end
end