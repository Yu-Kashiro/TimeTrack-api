FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "testuser#{n}@example.com" }
    password { "password123" }
    name { "テストユーザー" }
  end

  factory :guest_user, parent: :user do
    sequence(:email) { |n| "testguest#{n}@example.com" }
    name { "ゲストユーザー" }
  end
end
