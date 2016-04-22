module PricingPolicy
  class Prestige < Base

    private
    
    RSS_URI = 'http://www.yourlocalguardian.co.uk/sport/rugby/rss/'

    def margin base_price
      document = request_document
      return 0 if document.nil?
      document.entries.select(&:published).count
    end

    def request_document
      Feedjira::Feed.fetch_and_parse(RSS_URI)
      rescue StandardError
    end

  end
end
