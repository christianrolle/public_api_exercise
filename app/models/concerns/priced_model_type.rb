class PricedModelType

  delegate :name, to: :model_type

  def initialize model_type
    @model_type = model_type
  end

  private

  attr_reader :model_type

end
