class CreateActivityComments < ActiveRecord::Migration
  def change
    create_table :activity_comments do |t|
    	t.integer :user_id
    	t.integer :activity_log_id
    	t.text :description
      t.timestamps null: false
    end
  end
end
