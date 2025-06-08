class WorkTime < ApplicationRecord
  belongs_to :user
  belongs_to :approved_by_id, class_name: User, optional: true
  belongs_to :job, presence: true

  validates :work_date, presence: true
  validates :clock_in
  validates :clock_out
  validates :work_minute, presence: true
  validates :break_duration_minute, presence: true
  validates :approved, presence: true
  validates :work_date, uniqueness: { scope: :user_id }
end
