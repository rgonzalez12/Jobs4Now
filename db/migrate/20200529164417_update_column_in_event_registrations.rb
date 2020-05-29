class UpdateColumnInEventRegistrations < ActiveRecord::Migration[6.0]
  def change
    remove_column :event_registrations, :user_id
    add_column :event_registrations, :host_id, :integer
  end
end
