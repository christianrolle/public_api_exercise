module PricingPolicy
  class Base

    def total_price base_price
      base_price + margin(base_price)
    end

    private

    def margin base_price
      raise NotImplementedError, 'You probably missed to override #margin'
    end

  end
end
