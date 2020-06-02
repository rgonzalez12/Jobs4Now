class RemoveIndexContraintFromJobApplications < ActiveRecord::Migration[6.0]
  def change
    remove_index :job_id, name: "index_job_applications_on_job_id_and_user_id"
  end
end
