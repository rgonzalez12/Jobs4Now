class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.datetime :event_time
      t.string :name
      t.string :description
      t.string :agenda
      t.integer :user_id

      t.timestamps
    end
  end
end
