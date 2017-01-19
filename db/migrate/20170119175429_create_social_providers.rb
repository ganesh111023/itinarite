class CreateSocialProviders < ActiveRecord::Migration
  def change
    create_table :social_providers do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid

      t.timestamps null: false
    end
  end
end
