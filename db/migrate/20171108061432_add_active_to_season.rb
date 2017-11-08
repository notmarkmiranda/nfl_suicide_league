class AddActiveToSeason < ActiveRecord::Migration[5.1]
  def change
    add_column :seasons, :active, :boolean, default: true
  end
end
