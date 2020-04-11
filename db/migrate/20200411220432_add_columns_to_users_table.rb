class AddColumnsToUsersTable < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :resume, :text
    add_column :users, :cover_letter, :text
  end
end
