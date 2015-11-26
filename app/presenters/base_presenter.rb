class BasePresenter < SimpleDelegator

  def initialize model, view
    @view = view
    super(model)
  end

  private

  def h
    @view
  end
end