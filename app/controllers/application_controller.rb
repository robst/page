class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    load_collection
  end

  def new
    build_new_object
  end

  private

  def load_collection
    @collection = klass.all
  end

  def build_new_object
    @object = klass.new
  end

  def klass
    controller_name.classify.constantize
  end

end
