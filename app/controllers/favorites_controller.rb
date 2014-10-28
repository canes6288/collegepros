class FavoritesController < ApplicationController

  def new
    @favorites = Favorite.new
  end

  def create
    @favorites = Favorite.new(favorite_params)
    if @favorites.save
      redirect_back_or dashboard_path
    else
      render 'players/index'
    end
  end

    private

    def favorite_params
      params.require(:user).permit(:nerd_id)
    end
end
