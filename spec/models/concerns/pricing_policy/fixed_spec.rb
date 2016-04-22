require 'rails_helper'


RSpec.describe PricingPolicy::Fixed do

  subject { PricingPolicy::Fixed.new }

  describe "#total_price" do
    let!(:base_price) { 1000 }
    let!(:margin) { 9 }
    let!(:web_margin) { double }
    
    before { 
      allow(web_margin).to receive(:count).with('status').once.and_return(margin) 
      allow(PricingPolicy::WebMargin).to receive(:new).and_return(web_margin)
    }

    it "should return the base_price plus a fixed margin" do
      total_price = base_price + margin
      expect(subject.total_price base_price).to eq(total_price)
    end

    it "should cache fixed margin for performance reasons" do
      subject.total_price base_price
      subject.total_price base_price
    end
  end

end
