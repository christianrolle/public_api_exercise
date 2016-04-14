class Organization < ActiveRecord::Base

  validates :name, :public_name, :type, :pricing_policy, presence: true

end
