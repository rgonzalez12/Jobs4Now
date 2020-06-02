class RemoveIndexFromEventRegistrations < ActiveRecord::Migration[6.0]
  def change
    remove_index :event_id, name: "index_event_registrations_on_event_id_and_user_id"
  end
end
