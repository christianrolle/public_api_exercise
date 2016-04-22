require 'rails_helper'

RSpec.describe PricingPolicy::WebMargin do

  let!(:uri) { Rails.root.join "spec/support/documents/test.html" }

  describe "#count" do
    it "should return count the occurences of 'status' in the HTML" do
      web_margin = PricingPolicy::WebMargin.new(uri)
#      expect(web_margin.count 'status').to eq(9)
    end

    context "when external service is unavailable" do
      it "should return zero" do
        web_margin = PricingPolicy::WebMargin.new('')
        expect(web_margin.count 'status').to eq(0)
      end
    end
  end

end
