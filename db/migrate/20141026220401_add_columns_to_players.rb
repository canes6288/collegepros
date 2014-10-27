class AddColumnsToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :nerd_id, :integer
    add_column :players, :jersey_number, :string
    add_column :players, :last_name, :string
    add_column :players, :first_name, :string
    add_column :players, :team, :string
    add_column :players, :position, :string
    add_column :players, :school, :string
  end
end
