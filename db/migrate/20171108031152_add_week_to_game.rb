class AddWeekToGame < ActiveRecord::Migration[5.1]
  def change
    remove_column :games, :season_id, index: true
    add_reference :games, :week, index: true
  end
end
