FactoryBot.define do
  factory :member do
    id { 1 }
    group_id { 1 }
    name { "テストメンバー" }
    email { "member@example.com" }
    password { 'password' }
  end
end