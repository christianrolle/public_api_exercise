require 'rails_helper'


RSpec.describe PricingPolicy::Fixed do

  subject { PricingPolicy::Fixed.new }

  describe "#total_price" do
    let!(:base_price) { 1000 }
    let!(:web_margin) { double }
    before { 
      allow(web_margin).to receive(:count).with('status').and_return(9) 
      allow(PricingPolicy::WebMargin).to receive(:new).and_return(web_margin)
    }

    it "should return the base_price plus a fixed margin" do
      expect(subject.total_price base_price).to eq(1009)
    end

    it "should cache fixed margin for performance reasons" do
      subject.total_price base_price
      expect(web_margin).not_to receive(:count).with('status')
      subject.total_price base_price
    end
  end

end
