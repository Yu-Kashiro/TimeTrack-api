FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password123" }
    password_confirmation { "password123" }
    name { "テストユーザー" }
    confirmed_at { Time.current }
  end

  factory :guest_user, parent: :user do
    sequence(:email) { |n| "guest_#{SecureRandom.uuid}@example.com" }
    name { "ゲストユーザー" }
  end
end
