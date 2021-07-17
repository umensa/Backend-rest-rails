require 'faker'

FactoryBot.define do
  factory :user do |f|
    f.username { Faker::Name.name }
    f.password { Faker::Lorem.word }
  end
end
