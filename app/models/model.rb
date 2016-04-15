class Model < ActiveRecord::Base

  belongs_to :organization

  validates :name, :model_slug, :organization, presence: true

end
