class AddWeekToGame < ActiveRecord::Migration[5.1]
  def change
    add_reference :games, :week, index: true
    remove_column :games, :season_id, index: true
  end
end
