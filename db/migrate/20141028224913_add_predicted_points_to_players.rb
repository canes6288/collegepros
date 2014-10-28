class AddPredictedPointsToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :predicted_points, :string
  end
end
