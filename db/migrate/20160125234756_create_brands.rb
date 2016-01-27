class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
    	t.integer :user_id
    	t.string :point_of_contact
    	t.string :contact_email
    	t.string :brand_name

      t.timestamps null: false
    end
  end
end
