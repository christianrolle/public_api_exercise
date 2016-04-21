FactoryGirl.define do
  factory :model do
    association :organization, strategy: :build
    name "serie_1"
    model_slug "serie_1"

    trait :with_model_types do
      after(:build) do |model|
        model.model_types = build_list(:model_type, 1)
      end
    end
  end
end
