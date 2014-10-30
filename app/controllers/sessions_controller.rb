class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      redirect_back_or(dashboard_path(user))
    else
      flash[:danger] = "Sorry! Try signing in again!"
      redirect_to root_path
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
