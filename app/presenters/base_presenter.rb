class BasePresenter < SimpleDelegator
  attr_accessor :options
  def initialize model, view, options={}
    @view = view
    self.options = available_options.merge options
    super(model)
  end
#new, remove it from article
  def self.present_collection collection, view
    collection.collect{ |object| self.new(object, view, excerpt: true) }
  end

  private

  def available_options
    {excerpt: false}
  end

  def h
    @view
  end
end