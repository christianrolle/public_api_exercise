class Organization < ActiveRecord::Base

  validates :name, :public_name, presence: true

end
