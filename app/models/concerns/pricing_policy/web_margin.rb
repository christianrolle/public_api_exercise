require 'open-uri'

module PricingPolicy
  class WebMargin

    attr_accessor :uri

    def initialize uri
      @uri = uri
    end

    def count regexp
      content.scan(regexp).count
    end

    private

    def content
      document = request_document
      return '' if document.nil?
      html = Nokogiri::HTML(document.read)
      html.search('script, style').remove
      html.at('body').inner_html
    end

    def request_document
      open(uri)
      rescue StandardError
    end
  end
end
