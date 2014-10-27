class PlayersController < ApplicationController


#not sure how to take the school that is chosen by the user on signup...
  def index
    @players = Player.where(school: @user.school)
  end
end


