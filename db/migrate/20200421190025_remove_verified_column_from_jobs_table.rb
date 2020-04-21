class RemoveVerifiedColumnFromJobsTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :verified
  end
end
