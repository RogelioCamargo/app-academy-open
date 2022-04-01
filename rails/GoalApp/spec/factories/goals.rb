FactoryBot.define do
  factory :goal do
		title { Faker::Lorem.words(3).join(" ") }
		details { Faker::Lorem.words(5).join(" ") }
  end
end
