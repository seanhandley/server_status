class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
 
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
    @current_user
  end                        
  
end
