class CreateSkillsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.string :name
      t.string :field
    end
  end
end
