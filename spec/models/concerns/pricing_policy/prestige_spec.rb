require 'rails_helper'

module Test
  rss = File.open(Rails.root.join "spec/support/documents/test.rss").read
  RSS = Feedjira::Feed.parse rss
end

RSpec.describe PricingPolicy::Prestige do

  subject { PricingPolicy::Prestige.new }

  describe "#total_price" do
    let!(:base_price) { 1000 }
    before { allow(subject).to receive(:document).and_return(Test::RSS) }
    
    it "should return the base_price with a prestige margin" do
      total_price = base_price + 50
      expect(subject.total_price base_price).to eq(total_price)
    end
  end

end
