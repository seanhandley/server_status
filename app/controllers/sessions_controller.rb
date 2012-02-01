class SessionsController < ApplicationController

  def create
    if user = User.find_by_username(params[:username]).
              try(:authenticate, params[:password])
      session[:user_id] = user.id
      flash[:success] = "Logged in successfully"
      redirect_to root_path
    else
      flash[:error] = "Invalid username or password"
      redirect_to root_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end