FactoryBot.define do
  factory :work_time do
    association :user
    work_date { Date.current }
    clock_in { "08:30:00" }
    clock_out { "17:15:00" }
    work_minute { 465 }
    break_duration_minute { 60 }
    is_paid_holiday { false }
    approved { false }
  end

  factory :paid_holiday, parent: :work_time do
    clock_in { nil }
    clock_out { nil }
    work_minute { 0 }
    break_duration_minute { 0 }
    is_paid_holiday { true }
  end
end
