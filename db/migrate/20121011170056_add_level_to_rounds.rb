class AddLevelToRounds < ActiveRecord::Migration
	def change
		add_column :rounds, :level, :integer
	end
end
