class WorkTime < ApplicationRecord
  belongs_to :user
  belongs_to :approved_by_id, class_name: "User", optional: true
  belongs_to :job, optional: true

  validates :work_date, presence: true
  validates :work_minute, presence: true
  validates :break_duration_minute, presence: true
  validates :work_date, uniqueness: { scope: :user_id }
end
