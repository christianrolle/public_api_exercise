require 'rails_helper'

RSpec.describe ModelsController, type: :controller do
  include PublicApiRestrictableHelper

  let!(:model) { build :model }
  before { apply_valid_token }

  describe "routing" do
    it { should route(:get, "/models/serie_3/model_types")
            .to(action: :index, model_slug: "serie_3") }
  end

  it { should use_before_action(:restrict_public_api_access) }

  describe "GET #index" do
    let!(:params) { { model_slug: model.model_slug, format: :json } }

    context "when invalid authentication token" do
      it "should respond with status 401" do
        clear_token
        get :index, params 
        expect(response.status).to eq(401)
      end
    end
  end
end
