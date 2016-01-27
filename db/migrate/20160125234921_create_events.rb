class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.belongs_to :user
    	t.string :location
    	t.date :event_date

      t.timestamps null: false
    end
  end
end
