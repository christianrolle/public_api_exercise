class Organization < ActiveRecord::Base

  validates :name, :public_name, :pricing_policy, presence: true
  validates :type, presence: true, 
    inclusion: { in: ['Show room', 'Service', 'Dealer'] }

end
