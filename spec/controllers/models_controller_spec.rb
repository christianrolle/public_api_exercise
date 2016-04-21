require 'rails_helper'

RSpec.describe ModelsController, type: :controller do
  include PublicApiRestrictableHelper

  before { apply_valid_token }

  describe "routing" do
    it { should route(:get, "/models/serie_3/model_types")
            .to(action: :index, model_slug: "serie_3") }
  end

  it { should use_before_action(:restrict_public_api_access) }

end
