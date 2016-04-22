module PricingPolicy
  class Flexible < Base

    def total_price base_price
      margin_factor = WebMargin.new(URI).count('a').to_f / 100.0
      base_price * margin_factor.round
    end

    private

    URI = 'http://reuters.com'

  end
end
