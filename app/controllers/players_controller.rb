class PlayersController < ApplicationController

  def index
    @user = current_user
    @players = Player.where(school: @user.school)
  end
end



