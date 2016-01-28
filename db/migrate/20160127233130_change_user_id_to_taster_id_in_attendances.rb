class ChangeUserIdToTasterIdInAttendances < ActiveRecord::Migration
  def change
  	rename_column :attendances, :user_id, :taster_id
  end
end
