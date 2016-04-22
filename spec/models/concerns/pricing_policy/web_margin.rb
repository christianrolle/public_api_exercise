require 'rails_helper'

module Test
  HTML = File.open(Rails.root.join "spec/support/documents/test.html")
end

RSpec.describe PricingPolicy::WebMargin do

  subject { PricingPolicy::WebMargin.new('uri') }

  describe "#count" do
    before { allow(subject).to receive(:document).and_return(Test::HTML) }

    it "should return count the occurences of 'status' in the HTML" do
      expect(subject.count 'status').to eq(9)
    end
  end

end
