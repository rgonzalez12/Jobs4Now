class CreateMasteryTable < ActiveRecord::Migration[6.0]
  def change
    create_table :mastery do |t|
      t.integer :skill_id
      t.integer :user_id
      t.integer :star_rating
    end
  end
end
