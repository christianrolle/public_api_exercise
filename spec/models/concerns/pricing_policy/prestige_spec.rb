require 'rails_helper'

module Test
  rss = File.open(Rails.root.join "spec/support/documents/test.rss").read
  RSS = Feedjira::Feed.parse rss
end

RSpec.describe PricingPolicy::Prestige do
  
  subject { PricingPolicy::Prestige.new }

  describe "#total_price" do
    let!(:base_price) { 1000 }
    
    it "should return the base_price with a prestige margin" do
      allow(subject).to receive(:request_document).and_return(Test::RSS)
      total_price = base_price + 50
      expect(subject.total_price base_price).to eq(total_price)
    end

    context "when external service is unavailable" do
      it "should return zero" do
        stub_const("PricingPolicy::Prestige::RSS_URI", '')
        expect(subject.total_price base_price).to eq(base_price)
      end
    end
  end

end
