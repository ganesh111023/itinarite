class ActivityCommentTable < ActiveRecord::Migration
  def change
  	 drop_table :activity_comments
  end
end
