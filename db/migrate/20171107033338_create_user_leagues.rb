class CreateUserLeagues < ActiveRecord::Migration[5.1]
  def change
    create_table :user_leagues do |t|
      t.references :user, foreign_key: true
      t.references :league, foreign_key: true
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
