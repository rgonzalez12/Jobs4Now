class CreateEventRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :event_registrations do |t|
      t.integer :user_id
      t.integer :event_id
    end
  end
end
