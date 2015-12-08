class SessionsController < ApplicationController
  before_action :load_object, only: [:new, :create]

  def new
  end

  def create
    save_object || render_new
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  private

  def load_object
    @login = Login.new(login_params)
  end

  def save_object
    if @login.save
      session[:user_id] = @login.user.id
      render_index
    end
  end

  def render_index
    redirect_to root_url
  end

  def render_new
    render :new
  end

  def login_params
    return if params[:login].blank?
    params.require(:login).permit(:username, :password)
  end
end
