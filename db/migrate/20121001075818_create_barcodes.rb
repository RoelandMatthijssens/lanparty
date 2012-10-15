class CreateBarcodes < ActiveRecord::Migration
	def change
		create_table :barcodes do |t|
			t.string :code
			t.integer :item_id

			t.timestamps
		end
	end
end
