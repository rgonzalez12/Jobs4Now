class AddColumnToJobApplicationsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :attendee_id, :integer
  end
end
