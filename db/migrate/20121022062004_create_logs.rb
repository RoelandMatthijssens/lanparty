class CreateLogs < ActiveRecord::Migration
	def change
		create_table :logs do |t|
			t.string :message
			t.belongs_to :user

			t.timestamps
		end
		add_index :logs, :user_id
	end
end
