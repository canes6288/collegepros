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
    predicted_points_QB = HTTParty.get('http://www.fantasyfootballnerd.com/service/weekly-rankings/json/mv96pra5v766/QB')
    predicted_points_RB = HTTParty.get('http://www.fantasyfootballnerd.com/service/weekly-rankings/json/mv96pra5v766/RB')
    predicted_points_WR = HTTParty.get('http://www.fantasyfootballnerd.com/service/weekly-rankings/json/mv96pra5v766/WR')
    predicted_points_TE = HTTParty.get('http://www.fantasyfootballnerd.com/service/weekly-rankings/json/mv96pra5v766/TE')

    predicted_points_QB[ranking].each do |ranking|
      ranking.update(
        predicted_points: ranking["standard"])
    end
  end

  def self.update_predicted_points_QB
    response = HTTParty.get('http://www.fantasyfootballnerd.com/service/weekly-rankings/json/mv96pra5v766/QB')
    rankings = response["Rankings"]
    rankings.each do |player|
      nerd_id = player["playerId"]
      found_player = Player.find_by(nerd_id: nerd_id)
      points = player["standard"]

      found_player.update(predicted_points: points)
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
