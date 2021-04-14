FactoryBot.define do
  factory :manager do
    id { 1 }
    email { "manager@example.com" }
    password { 'password' }
  end
end