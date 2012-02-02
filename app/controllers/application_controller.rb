class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    if session[:user_id]
      User.find(session[:user_id]) rescue nil
    else
      nil
    end
  end
  helper_method :current_user

  def user_signed_in?
    redirect_to root_path unless current_user
  end

end
