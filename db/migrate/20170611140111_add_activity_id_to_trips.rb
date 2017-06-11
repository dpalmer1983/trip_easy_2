class AddActivityIdToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :activity_id, :integer
  end
end
