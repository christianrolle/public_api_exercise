require 'rails_helper'

RSpec.describe Model, type: :model do

  subject { FactoryGirl.build :model }

  describe "validations" do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:model_slug) }
    it { is_expected.to validate_presence_of(:organization) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:organization) }
  end

end
