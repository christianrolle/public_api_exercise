require 'rails_helper'

RSpec.describe PricingPolicy do

  describe ".for" do
    context "when factory for 'Flexible'" do
      it "should return a Flexible policy" do
        expect(described_class.for 'Flexible').to be_a(PricingPolicy::Flexible)
      end
    end

    context "when factory for 'Prestige'" do
      it "should return a Prestige policy" do
        expect(described_class.for 'Prestige').to be_a(PricingPolicy::Prestige)
      end
    end

    context "when factory for 'Fixed'" do
      it "should return a Fixed policy" do
        expect(described_class.for 'Fixed').to be_a(PricingPolicy::Fixed)
      end
    end

    context "when factory for unknown" do
      it "should return a Fixed policy" do
        expect(described_class.for '').to be_a(PricingPolicy::Fixed)
      end
    end
  end

end
