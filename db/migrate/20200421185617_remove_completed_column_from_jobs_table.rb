class RemoveCompletedColumnFromJobsTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :jobs, :completed
  end
end
