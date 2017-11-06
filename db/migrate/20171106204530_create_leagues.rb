class CreateLeagues < ActiveRecord::Migration[5.1]
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :slug
      t.string :join_token
    end
    add_index :leagues, :join_token, unique: true
  end
end
