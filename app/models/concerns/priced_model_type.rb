class PricedModelType

  delegate :name, to: :model_type

  def initialize model_type
    @model_type = model_type
  end

  def total_price
    return if model_type.base_price.nil?
    pricing_policy_type.total_price model_type.base_price
  end

  private

  attr_reader :model_type

  delegate :model, to: :model_type

  def pricing_policy_type
    PricingPolicy.for model.pricing_policy
  end

end
