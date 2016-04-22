require 'rails_helper'

RSpec.describe PricingPolicy::WebMargin do

  let!(:uri) { Rails.root.join "spec/support/documents/test.html" }
  subject { PricingPolicy::WebMargin.new(uri) }

  describe "#count" do
    it "should return count the occurences of 'status' in the HTML" do
      expect(subject.count 'status').to eq(9)
    end
  end

end
