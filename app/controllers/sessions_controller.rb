class SessionsController < ApplicationController
  def new
  end

  def create
    user = Authentification.local_login params
    if user
      session[:user_id] = user.id
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
