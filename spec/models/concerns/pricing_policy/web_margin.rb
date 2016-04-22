require 'rails_helper'

RSpec.describe PricingPolicy::WebMargin do

  subject { PricingPolicy::WebMargin.new('uri') }

  describe "#count" do
    let(:html) { File.open(Rails.root.join "spec/support/documents/test.html") }
    before { allow(subject).to receive(:document).and_return(html) }

    it "should return the base_price plus a fixed margin" do
      expect(subject.count 'status').to eq(9)
    end
  end

end
