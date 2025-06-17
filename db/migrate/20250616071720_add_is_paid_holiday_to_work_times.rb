class AddIsPaidHolidayToWorkTimes < ActiveRecord::Migration[7.2]
  def change
    add_column :work_times, :is_paid_holiday, :boolean
  end
end
