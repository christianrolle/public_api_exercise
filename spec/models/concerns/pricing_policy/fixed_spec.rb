require 'rails_helper'

RSpec.describe PricingPolicy::Fixed do

  subject { PricingPolicy::Fixed.new }

  describe "#total_price" do
    let!(:base_price) { 1000 }
    let!(:uri) { 'https://developer.github.com/v3/#http-redirects' }

    it "should return the base_price plus a fixed margin" do
      web_margin = PricingPolicy::WebMargin.new(uri)
      allow(web_margin).to receive(:count).with('status').and_return(9)
      expect(subject.total_price base_price).to eq(1009)
    end

  end
end
