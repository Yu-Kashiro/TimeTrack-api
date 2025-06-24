class WorkTime < ApplicationRecord
  belongs_to :user
  belongs_to :approved_by_id, class_name: "User", optional: true
  belongs_to :job, optional: true

  validates :work_date, presence: true
  validates :work_minute, presence: true
  validates :break_duration_minute, presence: true
  validates :work_date, uniqueness: { scope: :user_id }

  after_validation :localized_date_uniqueness_error

  private

  def localized_date_uniqueness_error
    if Array(errors.details[:work_date]).any? { |e| e[:error] == :taken }
      errors.delete(:work_date)
      jp_date = "#{work_date.month}月#{work_date.day}日"
      errors.add(:base, "#{jp_date} はすでに登録されています")
    end
  end
end
