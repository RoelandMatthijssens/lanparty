class AddCompetitionTypeToCompo < ActiveRecord::Migration
	def change
		add_column :compos, :competition_type, :string
	end
end
