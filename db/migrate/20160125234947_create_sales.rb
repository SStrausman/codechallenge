class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
    	t.belongs_to :beverage
    	t.belongs_to :event

      t.timestamps null: false
    end
  end
end
