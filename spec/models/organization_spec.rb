require 'rails_helper'

RSpec.describe Organization, type: :model do
  subject { FactoryGirl.build :organization }

  describe "validations" do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:public_name) }
  end
end
