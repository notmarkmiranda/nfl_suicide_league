class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :abbreviation
      t.string :name

      t.timestamps null: false
    end
  end
end
