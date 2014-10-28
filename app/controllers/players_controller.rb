class PlayersController < ApplicationController

  def index
    @user = current_user
    @players = Player.where(school: @user.school)
  end

  def create
    @user = current_user
    params[:favorites]["player_nerd_ids"].each do |id|
      @user.players << Player.find_by(nerd_id: id)
    end
    redirect_to dashboard_path
  end

  def dashboard
    @user = current_user
  end
end
