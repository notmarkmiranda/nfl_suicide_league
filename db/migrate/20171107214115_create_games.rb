class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.datetime :start
      t.integer :home_id
      t.integer :away_id
      t.integer :h_score
      t.integer :a_score
      t.integer :week
      t.boolean :completed
      t.references :season, foreign_key: true

      t.timestamps null: false
    end
  end
end
