class SessionsController < ApplicationController

  # GET /sessions
  def new
  end

  # POST /sessions
  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:user] = user.id
      redirect_to venerations_path, notice: "Welcome back, #{user.email.split("@").first.titleize}!"
    elsif user
      redirect_to venerations_path, notice: "Sorry, couldn't authenticate."
    else
      user = User.create(
        email: params[:email].downcase,
        password: params[:password],
        password_confirmation: params[:password],
      )
      session[:user] = user.id
      redirect_to venerations_path, notice: "Thanks for joining us, #{user.email.split("@").first.titleize}!"
    end
    puts user
  end

  # DELETE /sessions
  def destroy
    session[:user] = nil
    redirect_to root_path
  end
end
