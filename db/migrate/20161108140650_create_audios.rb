class CreateAudios < ActiveRecord::Migration
  def change
    create_table :audios do |t|
      t.string :audio
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
