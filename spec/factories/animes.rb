FactoryBot.define do
  factory :anime do
    name { Faker::Lorem.characters(number:5) }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/profile.png'), 'image/png') }
    quote { Faker::Lorem.characters(number:5) }
    quote_url { Faker::Lorem.characters(number:15) }
    introduction { Faker::Lorem.characters(number:20) }

    association :user
    association :genre
  end
end
