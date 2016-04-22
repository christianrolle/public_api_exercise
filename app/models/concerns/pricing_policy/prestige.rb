module PricingPolicy
  class Prestige < Base

    private
    
    RSS_URI = 'http://www.yourlocalguardian.co.uk/sport/rugby/rss/'

    def margin base_price
      document.entries.select(&:published).count
    end

    def document
      Feedjira::Feed.fetch_and_parse(RSS_URI)
    end
  end
end
