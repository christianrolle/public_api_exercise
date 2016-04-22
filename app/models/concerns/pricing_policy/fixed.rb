module PricingPolicy
  class Fixed < Base

    private

    URI = 'https://developer.github.com/v3/#http-redirects'

    def margin base_price
      self.class.margin
    end

    def self.margin
      @margin ||= PricingPolicy::WebMargin.new(URI).count('status')
    end

  end
end
