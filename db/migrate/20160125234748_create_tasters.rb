class CreateTasters < ActiveRecord::Migration
  def change
    create_table :tasters do |t|
    	t.integer :user_id
    	t.string :real_name

      t.timestamps null: false
    end
  end
end
