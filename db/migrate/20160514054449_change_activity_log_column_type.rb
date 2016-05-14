class ChangeActivityLogColumnType < ActiveRecord::Migration
  def change
  	change_column :activity_logs, :user_id, :integer
  end
end
