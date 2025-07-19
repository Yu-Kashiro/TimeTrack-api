FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { "password123" }
    name { "テストユーザー" }
  end

  factory :guest_user, parent: :user do
    email { Faker::Internet.unique.email }
    name { "ゲストユーザー" }
  end
end
