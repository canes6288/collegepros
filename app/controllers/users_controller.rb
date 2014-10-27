class UsersController < ApplicationController

  def new
    @user = User.new
    @school_options = Player.school_names.sort
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_back_or players_path

    else
      render 'static_pages/home'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email,
        :password, :password_confirmation, :school)
    end
end
