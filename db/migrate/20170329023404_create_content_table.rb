class CreateContentTable < ActiveRecord::Migration
	def change
		create_table :contents do |t|
			t.string :title
			t.string :text

			t.timestamps
		end
	end
end
