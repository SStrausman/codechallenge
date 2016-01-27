class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
    	t.belongs_to :user
    	t.belongs_to :event
    	t.boolean :check_in, default: false
    	t.boolean :check_out, default: false

      t.timestamps null: false
    end
  end
end
