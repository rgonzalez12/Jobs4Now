class AddColumnToJobsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :applicant_id, :integer
  end
end
