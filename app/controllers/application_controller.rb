class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
    helper_method :current_user

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logoutuser
      @logoutuser = 'Log Out #{current_user.handle}'
    end

    def authorize
      redirect_to login_path, alert: "You are not authorized. Login or suffer the consequences!" if current_user.nil?
    end

end
