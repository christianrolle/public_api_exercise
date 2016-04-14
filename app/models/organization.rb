class Organization < ActiveRecord::Base

  validates :name, :public_name, :type, presence: true

end
