FactoryBot.define do
  factory :task do
    association :user
    task_title { "test" }
    due_date { "Wed, 29 Jun 2022 00:00:00" }
    status { 0 }
  end
end