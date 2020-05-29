class AddEmployerNameToJobsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :employer_name, :string
  end
end
