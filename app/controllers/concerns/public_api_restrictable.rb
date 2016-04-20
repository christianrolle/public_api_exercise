module PublicApiRestrictable
  extend ActiveSupport::Concern

  included do
    before_filter :restrict_public_api_access
  end

  private

  def restrict_public_api_access
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end
  end

end
