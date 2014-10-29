class Player < ActiveRecord::Base
  has_and_belongs_to_many :users

  def self.import_all_players
    players = HTTParty.get('http://www.fantasyfootballnerd.com/service/players/json/mv96pra5v766/').first.last

    players.each do |player|
      if player["active"] == "1"
        Player.create(
          name: player["displayName"],
          last_name: player["lname"],
          first_name: player["fname"],
          team: player["team"],
          position: player["position"],
          school: player["college"],
          nerd_id: player["playerId"],
          predicted_points: 0
        )
      end
    end
  end

  def self.update_predicted_points
    positions = ["QB","RB","WR","TE", "K"]

    positions.each do |position|
      response = HTTParty.get("http://www.fantasyfootballnerd.com/service/weekly-rankings/json/mv96pra5v766/#{position}")
      rankings = response["Rankings"]

      rankings.each do |player|
        nerd_id = player["playerId"]
        found_player = Player.find_by(nerd_id: nerd_id)
        points = player["standard"]
        found_player.update(predicted_points: points)
      end
    end
  end


  def self.school_names
    pluck(:school).uniq.reject(&:empty?)
  end

  # def add_favorites_by_id
  #   @player_ids = player.id
  #   @player_ids.each do |id|
  #     @user.players << Player.find(id)
  #   end
  # end
end
