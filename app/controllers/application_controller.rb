class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from Exceptions::NotLoggedInException, with: :redirect_to_login

  helper_method :current_user, :logged_in?


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    return false unless current_user
    true
  end

  protected

  def redirect_to_login
    redirect_to :new_session
  end

  private

  def authenticate!
    return if current_user
    raise Exceptions::NotLoggedInException
  end

end
