class CreateBeverages < ActiveRecord::Migration
  def change
    create_table :beverages do |t|
    	t.belongs_to :brand
    	t.string :beverage_type
    	t.float :sale_price

      t.timestamps null: false
    end
  end
end
