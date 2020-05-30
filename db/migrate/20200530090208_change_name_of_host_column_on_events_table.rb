class ChangeNameOfHostColumnOnEventsTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :employer_name, :host_name
  end
end
