class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :review_info
      t.integer :user_id
      t.integer :job_id
    end
  end
end
