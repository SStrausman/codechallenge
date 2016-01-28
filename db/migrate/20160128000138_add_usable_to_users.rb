class AddUsableToUsers < ActiveRecord::Migration
	change_table(:users) do |t|
	  t.belongs_to :usable, polymorphic: true
	end
end