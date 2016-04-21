class Organization < ActiveRecord::Base
  self.inheritance_column = :_type_disabled

  validates :name, :public_name, presence: true
  validates :type, presence: true, 
    inclusion: { in: ['Show room', 'Service', 'Dealer'] }
  validates :pricing_policy, presence: true, 
    inclusion: { in: %w(Flexible Fixed Prestige) }

end
