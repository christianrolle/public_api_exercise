module PricingPolicy
  POLICIES = {
    'flexible' => Flexible,
    'prestige' => Prestige
  }

  def self.for name
    policy_klass = POLICIES[name.to_s.downcase] || Fixed
    policy_klass.new
  end
end
