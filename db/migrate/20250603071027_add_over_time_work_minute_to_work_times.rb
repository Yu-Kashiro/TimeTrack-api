class AddOverTimeWorkMinuteToWorkTimes < ActiveRecord::Migration[7.2]
  def change
    add_column :work_times, :overtime_work_minute, :integer
  end
end
