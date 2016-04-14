class ModelType < ActiveRecord::Base

  belongs_to :model
  
  validates :name, :model_type_slug, presence: true
  validates :base_price, presence: true, 
    numericality: { only_integer: true }

end