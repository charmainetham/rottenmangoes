class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user


  protected

  def restrict_access
    if !current_user
      flash[:alert] = "You must log in."
      redirect_to new_session_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin?
    if current_user.admin
      true
    else
      false
    end
  end

  def authorize
    unless admin?
      flash[:error] = "not authorized"
      redirect_to root_path
      false
    end
  end
  
end
  