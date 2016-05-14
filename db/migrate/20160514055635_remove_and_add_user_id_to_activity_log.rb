class RemoveAndAddUserIdToActivityLog < ActiveRecord::Migration
  def change
  	remove_column :activity_logs, :user_id
  	add_column :activity_logs, :user_id, :integer
  end
end
