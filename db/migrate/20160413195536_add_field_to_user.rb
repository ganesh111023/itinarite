class AddFieldToUser < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :profile_picture, :string
  	add_column :users, :address, :text
  end
end
