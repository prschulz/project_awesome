class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def is_authenticated
    if !session[:user_id]
      redirect_to root_path
    end
  end

end
