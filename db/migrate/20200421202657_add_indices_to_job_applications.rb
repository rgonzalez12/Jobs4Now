class AddIndicesToJobApplications < ActiveRecord::Migration[6.0]
  def change
    add_index :job_applications, [:job_id, :user_id], unique: true
  end
end
