class CreateEvents < ActiveRecord::Migration
	def change
		create_table :events do |t|
			t.string :title
			t.string :desc
			t.string :place
			t.float :price, :default => 0.0
			t.datetime :starts_at
			t.datetime :ends_at

			t.timestamps
		end
	end
end
