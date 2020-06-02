class RenameAndDeleteColumnsFromUsersTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :first_name, :name
    remove_column :users, :last_name
  end
end
