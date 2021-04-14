FactoryBot.define do
  factory :manager do
    id { 1 }
    email { "manager@example.com" }
    password { 'password' }
  end
  
  factory :group, class: 'Group' do
    id { 1 }
    manager_id { 1 }
    name { "グループ１" }
  end
  
end