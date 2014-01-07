class CreateTickets < ActiveRecord::Migration
	def change
		create_table :tickets do |t|
			t.belongs_to :user
			t.belongs_to :event
			t.string :ticket_num

			t.timestamps
		end
	end
end
