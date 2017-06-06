class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :destination
      t.date :start_date
      t.date :end_date
      t.text :description
      t.integer :user_id

      t.timestamps

    end
  end
end
