class AddRetailerIdToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :retailer_id, :integer
  end
end
