class CreateActivityLogs < ActiveRecord::Migration
  def change
    create_table "activity_logs", :force => true do |t|
	    t.string "user_id"
	    t.string "browser"
	    t.string "ip_address"
	    t.string "controller"
	    t.string "action"
	    t.text "params"
	    t.string "note"
	    t.datetime "created_at"
	    t.datetime "updated_at"
		end
	end
end
