FactoryBot.define do
  factory :user do
    name { "testuser1" }
    password { "password" }
    email { Faker::Internet.email }
    admin { true }
  end
end