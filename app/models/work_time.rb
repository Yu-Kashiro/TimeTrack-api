class WorkTime < ApplicationRecord
  belongs_to :user
  belongs_to :approved_by_id, class_name: User, optional: true
  belongs_to :job, presence: true

  validates :work_date, presence: true
  validates :clock_in, presence: true
  validates :clock_out, presence: true
  validates :work_minute, presence: true
  validates :break_duration_minute, presence: true
  validates :approved, presence: true
end
