class CreateUserAssessments < ActiveRecord::Migration
  def change
    create_table :user_assessments do |t|
    	t.belongs_to :user
    	t.belongs_to :assessment

      t.timestamps null: false
    end
  end
end
