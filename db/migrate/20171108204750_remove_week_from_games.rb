class RemoveWeekFromGames < ActiveRecord::Migration[5.1]
  def change
    remove_column :games, :week, :integer
  end
end
