class Model < ActiveRecord::Base

  belongs_to :organization
  has_many :model_types

  validates :name, :model_slug, :organization, presence: true

end
