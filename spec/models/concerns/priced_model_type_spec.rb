require 'rails_helper'

RSpec.describe PricedModelType do

  let!(:model_type) { build :model_type }
  subject { PricedModelType.new model_type }

  describe "delegations" do
    it { is_expected.to delegate_method(:name).to(:model_type) }
  end

  describe "#total_price" do
    let!(:pricing_policy) { PricingPolicy::Fixed.new }
    before {
      allow(model_type.model).to receive(:pricing_policy).and_return('Fixed')
    }

    it "should return a price with fixed margin" do
      total_price = model_type.base_price + 10
      allow(pricing_policy).to receive(:total_price).and_return(total_price)
      expect(PricingPolicy).to receive(:for).and_return(pricing_policy)

      expect(subject.total_price).to eq(total_price)
    end

    context "when model_type has no defined base_price" do
      it "should return nil" do
        model_type.base_price = nil
        expect(subject.total_price).to be_nil
      end
    end
  end
end
