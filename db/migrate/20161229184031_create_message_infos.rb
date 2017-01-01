class CreateMessageInfos < ActiveRecord::Migration
  def change
    create_table :message_infos do |t|
      t.integer :user_id
      t.integer :message_id
      t.string :status
      t.timestamps null: false
    end
  end
end
