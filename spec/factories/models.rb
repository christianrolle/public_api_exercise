FactoryGirl.define do
  factory :model do
    association :organization, strategy: :build
    name "serie_1"
    model_slug "serie_1"
  end
end
