class AddEmployerNameToEventsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :employer_name, :string
  end
end
