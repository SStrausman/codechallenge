class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
    	t.belongs_to :event
    	t.belongs_to :user
    	t.attachment :image

      t.timestamps null: false
    end
  end
end
