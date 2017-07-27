class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :admin?
  #before_action :current_user

  def home
  end

  def authorize_user
    if !logged_in?
      redirect_to root_path
    end
  end

  def current_user

    @user ||= User.find_by(id: session[:user_id])
    # if @current_user
    #   @current_user
    # else
    #   @current_user = User.find_by(id: session[:current_user_id])
    # end
  end

  def logged_in?
    !!current_user
  end

  def admin?
    current_user.admin
  end

end
