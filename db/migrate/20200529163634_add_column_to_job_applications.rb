class AddColumnToJobApplications < ActiveRecord::Migration[6.0]
  def change
    add_column :job_applications, :applicant_id, :integer
  end
end
