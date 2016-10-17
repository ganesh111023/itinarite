class AddDescriptionToActivity < ActiveRecord::Migration
  def change
  	add_column :activity_logs, :description, :text
  end
end
