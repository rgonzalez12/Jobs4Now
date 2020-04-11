class CreateJobApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :job_applications do |t|
      t.integer :job_id
      t.integer :user_id
    end
  end
end