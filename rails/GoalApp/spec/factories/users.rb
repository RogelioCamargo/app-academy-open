FactoryBot.define do
  factory :user do
    username { Faker::Internet.user_name }
    password { "naruto" }

    factory :rock_lee do
      username { "rock_lee" }
    end

    factory :sasuke do
      username { "sasuke" }
    end
  end
end
