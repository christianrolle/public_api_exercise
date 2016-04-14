class Model < ActiveRecord::Base

  belongs_to :organization

  validates :name, :model_slug, presence: true

end
