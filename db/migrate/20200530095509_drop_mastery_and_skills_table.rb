class DropMasteryAndSkillsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :mastery
    drop_table :skills
  end
end
