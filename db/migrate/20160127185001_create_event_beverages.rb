class CreateEventBeverages < ActiveRecord::Migration
  def change
    create_table :event_beverages do |t|
    	t.belongs_to :event
    	t.belongs_to :beverage

      t.timestamps null: false
    end
  end
end
