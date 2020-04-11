class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.integer :user_id
      t.text :description
      t.text :requirements
      t.string :compensation
      t.string :duration
      t.string :schedule
      t.string :field_of_work
      t.string :contact_info
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
