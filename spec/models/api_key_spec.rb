require 'rails_helper'

RSpec.describe ApiKey, type: :model do

  subject { FactoryGirl.build :api_key }

  it { is_expected.to be_valid }

  describe "#access_token" do
    it "should be uniq" do
      previous_api_key = FactoryGirl.create(:api_key)
      subject.run_callbacks :create
      expect(subject.access_token).not_to eq(previous_api_key.access_token)
    end
  end
end
