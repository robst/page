class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def index
    load_collection
  end

  def new
    build_new_object
  end

  def create
    build_new_object
    if update_object
      render_index
    else
      render_new
    end
  end

  def edit
    load_object
    render_new
  end  

  def update
    load_object
    if update_object
      render_index
    else
      render_new
    end
  end

  def destroy
    load_object
    @object.destroy
    render_index
  end

  private

  def load_collection
    @collection = klass.all
  end

  def load_object
    @object = klass.find(params[:id])
  end

  def build_new_object
    @object = klass.new
  end

  def update_object
    @object.attributes = object_params
    @object.save
  end

  def render_new
    render :new
  end

  def render_index
    redirect_to klass.to_s.underscore.pluralize.to_sym
  end


  def klass
    controller_name.classify.constantize
  end

  def param_class_name
    klass.to_s.underscore.to_sym
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    return false unless current_user
    true
  end

end
