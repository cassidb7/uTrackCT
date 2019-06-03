FactoryBot.define do
  factory :tag do
    tag_field { "MyString" }
    association :member, factory: :member
  end
end
