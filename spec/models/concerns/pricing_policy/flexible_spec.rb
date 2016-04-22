require 'rails_helper'


RSpec.describe PricingPolicy::Flexible do

  subject { PricingPolicy::Flexible.new }

  describe "#total_price" do
    let!(:base_price) { 1000 }
    let!(:quantity) { 150 }
    let!(:web_margin) { double }
    
    before { 
      allow(web_margin).to receive(:count).with('a').and_return(quantity) 
      allow(PricingPolicy::WebMargin).to receive(:new).and_return(web_margin)
    }

    it "should return the base_price plus a fixed margin" do
      total_price = base_price * (quantity.to_f / 100.0).round
      expect(subject.total_price base_price).to eq(total_price)
    end
  end

end
