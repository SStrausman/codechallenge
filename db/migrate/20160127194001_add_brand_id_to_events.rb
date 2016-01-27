class AddBrandIdToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :brand_id, :integer
  end
end
