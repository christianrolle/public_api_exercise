class Model < ActiveRecord::Base

  delegate :pricing_policy, to: :organization

  belongs_to :organization
  has_many :model_types

  validates :name, :model_slug, :organization, presence: true

end
