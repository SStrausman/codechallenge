class ChangeUserIdToTasterIdInAssessments < ActiveRecord::Migration
  def change
  	rename_column :taster_assessments, :user_id, :taster_id
  end
end
