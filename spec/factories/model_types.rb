FactoryGirl.define do
  factory :model_type do
    association :model, strategy: :build
    name "330i"
    model_type_slug "330i"
    model_type_code "330i code"
    base_price 2000000
  end
end
