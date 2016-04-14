class ModelType < ActiveRecord::Base

  belongs_to :model
  
  validates :name, :model_type_slug, :base_price, presence: true

end
