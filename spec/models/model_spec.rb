require 'rails_helper'

RSpec.describe Model, type: :model do

  subject { FactoryGirl.build :model }

  describe "validations" do
    it { is_expected.to be_valid }
  end

  describe "associations" do
    it { is_expected.to belong_to(:organization) }
  end

end
