require 'rails_helper'

module PublicApiRestrictableHelper

  def clear_token
    request.env['HTTP_AUTHORIZATION'] = nil
  end

  def apply_valid_token
    token = SecureRandom.hex
    allow(ApiKey).to receive(:exists?)
                        .with(access_token: token)
                        .and_return(true)
    request.env['HTTP_AUTHORIZATION'] = 
      ActionController::HttpAuthentication::Token.encode_credentials(token)
  end

end
