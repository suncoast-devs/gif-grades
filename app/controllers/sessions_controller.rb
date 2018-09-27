class SessionsController < ApplicationController
  protect_from_forgery except: "create"

  def create
    @user = User.from_auth_hash(request.env["omniauth.auth"])
    session[:user] = @user.id if @user
    redirect_to root_path
  end

  def destroy
    session[:user] = nil
    redirect_to root_path
  end
end
