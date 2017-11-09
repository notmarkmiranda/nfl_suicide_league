class CreatePicks < ActiveRecord::Migration[5.1]
  def change
    create_table :picks do |t|
      t.references :user_league, foreign_key: true
      t.references :team, foreign_key: true
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
