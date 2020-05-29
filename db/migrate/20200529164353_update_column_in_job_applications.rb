class UpdateColumnInJobApplications < ActiveRecord::Migration[6.0]
  def change
    remove_column :job_applications, :user_id
    add_column :job_applications, :employer_id, :integer
  end
end
