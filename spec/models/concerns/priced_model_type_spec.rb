require 'rails_helper'

RSpec.describe PricedModelType do

  let!(:model_type) { build :model_type }
  subject { PricedModelType.new model_type }

  describe "delegations" do
    it { is_expected.to delegate_method(:name).to(:model_type) }
  end
end
