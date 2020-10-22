FactoryBot.define do
  factory :link do
    sequence(:url) { "https://www.pokemon.com/us/" }
    sequence(:description) { "this is a link to the pokemon website"}
  end
end