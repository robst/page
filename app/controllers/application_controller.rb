class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :load_collection, only: :index

  def index; end

  private

  def load_collection
    @collection = klass.all
  end

  def klass
    controller_name.classify.constantize
  end

end
