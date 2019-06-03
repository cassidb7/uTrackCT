FactoryBot.define do
  factory :member do
    name { Faker::Name.name }
    website_url {'https://en.wikipedia.org/wiki/Apex_Legends'}
  end
end
