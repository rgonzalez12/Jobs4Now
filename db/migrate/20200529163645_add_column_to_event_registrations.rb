class AddColumnToEventRegistrations < ActiveRecord::Migration[6.0]
  def change
    add_column :event_registrations, :attendee_id, :integer 
  end
end
