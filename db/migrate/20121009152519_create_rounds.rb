class CreateRounds < ActiveRecord::Migration
	def change
		create_table :rounds do |t|
			t.integer :compo_id

			t.timestamps
		end
	end
end
