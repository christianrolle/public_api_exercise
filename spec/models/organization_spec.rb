require 'rails_helper'

RSpec.describe Organization, type: :model do
  subject { FactoryGirl.build :organization }

  describe "validations" do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:public_name) }
    it { is_expected.to validate_presence_of(:type) }
    it { is_expected.to validate_presence_of(:pricing_policy) }
    it { is_expected.to validate_inclusion_of(:type)
                          .in_array(['Show room', 'Service', 'Dealer']) }
  end
end
