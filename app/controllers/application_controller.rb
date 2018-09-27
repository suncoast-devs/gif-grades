class ApplicationController < ActionController::Base
  private

  def current_user
    User.find_by_id(session[:user])
  end

  def authenticate!
    unless current_user
      redirect_to sessions_path, notice: "Please, authenticate first."
    end
  end

  helper_method :current_user
end
