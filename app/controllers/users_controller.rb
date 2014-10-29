class UsersController < ApplicationController
  before_action :signed_in_user, only: [:home]
  before_action :correct_user, only: [:edit, :update, :destroy]

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

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Please sign in."
      end
    end
end
