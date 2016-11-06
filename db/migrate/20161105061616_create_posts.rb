class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :description
      t.string :address
      t.float :lat
      t.float :long
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
