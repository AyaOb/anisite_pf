FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number:5) }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
  end
end