class AddIndices < ActiveRecord::Migration[6.0]
  def change
    add_index :event_registrations, [:event_id, :user_id], unique: true
  end
end
