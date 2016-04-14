require 'rails_helper'

RSpec.describe ModelType, type: :model do

  subject { FactoryGirl.build :model_type }

  describe "validations" do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:model_type_slug) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:model) }
  end

end
