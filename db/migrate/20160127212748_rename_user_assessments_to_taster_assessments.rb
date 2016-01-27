class RenameUserAssessmentsToTasterAssessments < ActiveRecord::Migration
  def change
  	rename_table :user_assessments, :taster_assessments
  end
end
