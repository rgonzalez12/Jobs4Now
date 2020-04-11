class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.text :email
      t.string :password_digest
      t.string :phone_number
      t.string :address
      t.string :bio
      t.boolean :verified

      t.timestamps
    end
  end
end