class CreateRetailers < ActiveRecord::Migration
  def change
    create_table :retailers do |t|
    	t.integer :user_id
    	t.string :point_of_contact
    	t.string :contact_email
    	t.string :zip_code
    	t.string :retailer_name

      t.timestamps null: false
    end
  end
end
