class CreateWeeks < ActiveRecord::Migration[5.1]
  def change
    create_table :weeks do |t|
      t.references :season, foreign_key: true
      t.integer :number
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
