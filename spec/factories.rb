FactoryBot.define do
  factory(:review) do
    content {Faker::Hacker.say_something_smart}
    city {Faker::Address.city}
    country {Faker::Address.country}
    rating {rand(1...6)}
    user_name {Faker::Books::Dune.character}
  end
end