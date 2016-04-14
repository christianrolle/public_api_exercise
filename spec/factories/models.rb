FactoryGirl.define do
  factory :model do
    #association :organization, factory: :organization, strategy: :build
    association :organization, strategy: :build
    name "serie_1"
    model_slug "serie-1"
  end
end
